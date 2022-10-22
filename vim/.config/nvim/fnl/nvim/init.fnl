; (import-macros logger :nvim.logger)

(local {: make-func : maybe-join} (require :nvim.utils))

(fn filter [t cb]
  (collect [k v (pairs t)]
    (when (cb k v)
      (values k v))))

(fn try [value test cb]
  (if (test value) (cb value) value))

(fn normalise-map [rhs opts]
  (if (= (type rhs) :string)
      (if (and (vim.startswith rhs ":") (not= rhs ":"))
          (-> rhs
              (try #(not (. opts :selection)) #(.. :<cmd> (: $1 :sub 2)))
              (try #(and (not (vim.endswith (: $1 :lower) :<cr>)) (. opts :cr))
                   #(.. $1 :<cr>)))
          rhs)
      (.. "<cmd>lua " (make-func rhs) "()<CR>")))

(fn plug-map? [rhs]
  (and (= (type rhs) :string) (vim.startswith (rhs:lower) :<plug>)))

(fn make-map [cb]
  (lambda [modes lhs rhs ?opts]
    (let [options (vim.tbl_extend :force
                                  {:noremap (not (plug-map? rhs))
                                   :selection false
                                   :cr true}
                                  (or ?opts {}))
          map-opts (filter options #(not (or (= $1 :selection) (= $1 :cr))))
          normalised-rhs (normalise-map rhs options)]
      (when (= modes "")
        (error "At least one mode must be specified"))
      (each [mode (modes:gmatch ".")]
        (cb mode lhs normalised-rhs map-opts)))))

(local api (setmetatable {}
                         {:__index (fn [_ key]
                                     (let [func (.. :nvim_ (key:gsub "-" "_"))]
                                       (. vim.api func)))}))

(local ex
       (setmetatable {}
                     {:__index (fn [_ key]
                                 (fn [...]
                                   (api.command (.. key " "
                                                    (table.concat [...] " ")))))}))

(local func
       (setmetatable {}
                     {:__index (fn [_ key]
                                 (fn [...]
                                   (api.call_function key [...])))}))

(local opts
       (setmetatable {}
                     {:__newindex (fn [_ key val]
                                    (print (fennel.view {: key : val})))}))

(fn ?> [f ...]
  (let [(ok? val) (f)]
    (if (and ok? (not= val "")) val (?> ...))))

(fn set-opt [scope key value]
  (let [len (length key)
        opt (if (key:match "[-+^!]$") (key:sub 1 (- len 1)) key)
        l (lambda []
            (vim.split (. scope opt) ","))
        val (match (key:sub len)
              "-" (assert false :not-implemented)
              "^" (vim.list_extend value (l))
              "+" (vim.list_extend (l) value)
              _ value)]
    (tset scope opt (maybe-join val))))

(fn build-opts [table scope]
  (setmetatable table
                {:__index scope
                 :__newindex (fn [_ key val]
                               (set-opt scope key val))
                 :__call (fn [table opts]
                           (each [key value (pairs opts)]
                             (set-opt scope key value)))}))

; TODO: Allow setting buffer and window local options

(local opts (build-opts {:global (build-opts {} vim.go)
                         :window (build-opts {} vim.wo)
                         :buffer (build-opts {} vim.bo)}
                        vim.o))

(fn executable? [name]
  (func.executable name))

;; Exports

(setmetatable {:map (make-map api.set_keymap)
               :buf-map (make-map #(api.buf_set_keymap 0 $...))
               : api
               : ex
               : func
               : opts
               : executable?} {:__index api})
