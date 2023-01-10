; (import-macros logger :nvim.logger)

(fn maybe-join [value]
  (if (= (type value) :table)
      (table.concat value ",")
      value))

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
      rhs))

(fn plug-map? [rhs]
  (and (= (type rhs) :string) (vim.startswith (rhs:lower) :<plug>)))

(fn make-map [buffer]
  (lambda [modes lhs rhs ?opts]
      (when (= modes "")
        (error "At least one mode must be specified"))
      (let [options (vim.tbl_extend :force
                                    {:noremap (not (plug-map? rhs))
                                    :selection false
                                    :cr true
                                    :buffer buffer}
                                    (or ?opts {}))
            map-opts (filter options #(not (or (= $1 :selection) (= $1 :cr))))
            normalised-rhs (normalise-map rhs options)
            modes (icollect [m (modes:gmatch ".")] m)]
        (vim.keymap.set modes lhs normalised-rhs map-opts))))

(local api (setmetatable {}
                         {:__index (fn [_ key]
                                     (let [func (.. :nvim_ (key:gsub "-" "_"))]
                                       (. vim.api func)))}))

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

(local opt (build-opts {:global (build-opts {} vim.go)
                         :window (build-opts {} vim.wo)
                         :buffer (build-opts {} vim.bo)}
                        vim.o))

;; Exports
(setmetatable {:map (make-map false)
               :buf-map (make-map true)
               : api
               :fun vim.fn
               : opt} {:__index vim})
