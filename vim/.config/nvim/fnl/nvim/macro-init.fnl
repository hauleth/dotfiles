; (import-macros logger :nvim.logger)

(fn on [event pattern ...]
  "Run command on `event`"
  (let [body (if (list? ...) `(fn []
                                ,...) ...)]
    `(vim.api.nvim_create_autocmd ,(view event)
                                  {:pattern ,pattern
                                   :callback ,body
                                   :group au-id})))

(fn augroup [name ...]
  "Define auto group"
  `(let [,(sym :au-id) (vim.api.nvim_create_augroup ,(view name) {:clear true})]
     (import-macros {: on} :nvim)
     ,...
     au-id))

(fn command-func [body]
  (let [q-args (sym :q-args)
        f-args (sym :f-args)
        bang (sym :bang)
        lines (sym :lines)
        count (sym :count)
        reg (sym :reg)
        mods (sym :mods)
        smods (sym :smods)]
    `(lambda [arg#]
       (let [{:args ,q-args
              :fargs ,f-args
              :bang ,bang
              :line1 line1#
              :line2 line2#
              :range range#
              :count ,count
              :reg ,reg
              :mods ,mods
              :smods ,smods} arg#
             ,lines {:from line1# :to line2# :range range#}]
         ,body))))

(fn defcommand [name opts ...]
  (assert-compile (string.match (view name) "^%u%w*$")
                  "User defined command must start with uppercase letter" name)
  (let [(body opts) (if (= ... nil) (values opts {}) (values ... opts))
        body (if (list? body) (command-func body) body)]
    `(vim.api.nvim_create_user_command ,(view name) ,body ,opts)))

;; Exports

{: augroup : defcommand : on}
