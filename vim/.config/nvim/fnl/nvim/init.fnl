(import-macros logger :nvim.logger)

(global __nvim_functions__ {})

(fn filter [t cb]
  (collect [k v (pairs t)]
           (when (cb k v) (values k v))))

(fn try [value test cb]
  (if (test value) (cb value) value))

(fn make-func [func]
  (let [idx (+ (length __nvim_functions__) 1)]
    (tset __nvim_functions__ idx func)
    (.. "__nvim_functions__[" idx "]")))

(fn normalise-map [rhs opts]
  (if (= (type rhs) :string)
    (if (and (vim.startswith rhs ":") (not= rhs ":"))
      (-> rhs
          (try #(not (. opts :selection))
               #(.. "<cmd>" (: $1 :sub 2)))
          (try #(and (not (vim.endswith (: $1 :lower) "<cr>")) (. opts :cr))
               #(.. $1 "<cr>")))
      rhs)
    (.. "<cmd>lua " (make-func rhs) "()<CR>")))

(fn plug-map? [rhs]
  (and (= (type rhs) :string)
       (vim.startswith (rhs:lower) "<plug>")))

(fn make-map [cb]
  (lambda [modes lhs rhs ?opts]
    (let [options (vim.tbl_extend :force {:noremap (not (plug-map? rhs))
                                          :selection false
                                          :cr true}
                                  (or ?opts {}))
          map-opts (filter options #(not (or (= $1 :selection) (= $1 :cr))))
          normalised-rhs (normalise-map rhs options)]
      (when (= modes "") (error "At least one mode must be specified"))
      (each [mode (modes:gmatch ".")]
        (cb mode lhs normalised-rhs map-opts)))))


(local api (setmetatable {}
                         {:__index (fn [_ key]
                                     (let [func (.. "nvim_" key)]
                                       (. vim.api func)))}))

(local ex (setmetatable {}
                        {:__index (fn [_ key]
                                    (fn [...]
                                      (api.command (.. key " " (table.concat [...] " ")))))}))

(fn ?> [f ...] (let [(ok? val) (f)] (if (and ok? (not= val "")) val (?> ...))))

(fn get-opt [key]
  (let [bo #(pcall api.buf_get_option 0 key)
        wo #(pcall api.win_get_option 0 key)
        go #(values true (api.get_option key))]
    (?> bo wo go)))

(fn call [name ...]
  (api.call_function name [...]))

(fn executable? [name]
  (call :executable name))

;; Exports
(setmetatable {:map (make-map api.set_keymap)
               :buf-map (make-map #(api.buf_set_keymap 0 $...))
               : api
               : ex
               : call
               : make-func
               : get-opt
               : executable?} {:__index api})
