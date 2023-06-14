; (import-macros logger :nvim.logger)

(fn on [event pattern ...]
  "Run command on `event`"
  (let [args (sym :args)
        body `(fn [,args] ,...)]
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

; TODO: Make argument passing more explicit and find another way to pass
; options. Example idea may be to parse argument list and translate them to the
; options passed to the `nvim_create_user_command`. For example `arg` will be
; for single argument `?arg` for optional argument, etc. The main problem would
; be how to pass extra options to the command.
(fn command-func [body]
  (let [args (sym :args)
        bang (sym :bang)
        lines (sym :lines)
        count (sym :count)
        reg (sym :reg)
        mods (sym :mods)]
    `(lambda [arg#]
       (let [{:bang ,bang
              :count ,count
              :reg ,reg} arg#
             ,lines {:from arg#.line1 :to arg#.line2 :range arg#.range}
             ,args (setmetatable arg#.fargs {:__tostring (fn [] arg#.args)})
             ,mods (setmetatable arg#.smods {:__tostring (fn [] arg#.mods)})]
         ,body))))

(fn defcommand [name opts ...]
  (assert-compile (string.match (view name) "^%u%w*$")
                  "User defined command must start with uppercase letter" name)
  (let [(body opts) (if (= ... nil) (values opts {}) (values ... opts))
        body (if (list? body) (command-func body) body)]
    `(vim.api.nvim_create_user_command ,(view name) ,body ,opts)))

;; Exports

{: augroup : defcommand : on}
