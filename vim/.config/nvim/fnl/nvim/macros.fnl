(import-macros logger :nvim.logger)

(fn g [name value]
  "Set value for global Vim variable"
  `(tset vim.g ,name ,value))

(fn env [name value]
  "Set environment variable"
  (assert (sym? name))
  `(tset vim.env ,(view name) ,(if (= nil value) true value)))

(fn set-opt [scope name value]
  (assert (sym? name))
  (let [full-opt (view name)
        len (length full-opt)
        opt (if (full-opt:match "[-+^!]$") (full-opt:sub 1 (- len 1)) full-opt)]
    (match (full-opt:sub len)
      :- (assert false "not implemented")
      :^ `(let [v# ,value]
            (tset ,scope ,opt (if (= (. ,scope ,opt) "") v# (.. v# "," (. ,scope ,opt)))))
      :+ `(let [v# ,value]
            (tset ,scope ,opt (if (= (. ,scope ,opt) "") v# (.. (. ,scope ,opt) "," v#))))
      _ `(tset ,scope ,opt ,(if (= value nil) true value)))))

(fn opt [name value]
  "Set Vim option"
  (set-opt `vim.o name value))
(fn wopt [name value]
  "Set Vim window option"
  (set-opt `vim.wo name value))
(fn bopt [name value]
  "Set Vim buffer option"
  (set-opt `vim.bo name value))

(fn into-func [code]
  `(.. "lua " ((. (require :nvim) :make-func) (fn [] ,code)) "()"))

(fn on [event pattern ...]
  "Run command on `event`"
  `(vim.api.nvim_command (.. "au " ,(view event)
                             " " ,pattern
                             " " ,(into-func ...))))

(fn augroup [name ...]
  "Define auto group"
  `(do
    (vim.api.nvim_command ,(.. "augroup " (view name)))
    (vim.api.nvim_command "au!")
    ,...
    (vim.api.nvim_command "augroup END")))

(fn translate-opts [opts]
  (let [flags (icollect [k v (pairs opts)]
                        (match k
                          :bar (when v "-bar")
                          :bang (when v "-bang")
                          :register (when v "-register")
                          :buffer (when v "-buffer")
                          :range (.. "-range=" v)
                          :addr (.. "-addr=" v)
                          :complete (.. "-complete=" v)
                          :nargs (.. "-nargs=" v)))]
    (table.concat flags " ")))

(fn command-func [code]
  (let [bang (sym "bang")
        mods (sym "mods")
        f-args (sym "f-args")
        q-args (sym "q-args")
        reg (sym "reg")
        lines (sym "lines")
        ]
    `(.. "lua "
         ((. (require :nvim) :make-func) (fn [,bang ,mods ,f-args ,q-args ,reg ,lines] ,code))
         "('<bang>' == '!', '<mods>', {<f-args>}, <q-args>, [[<reg>]], {from=<line1>, to=<line2>, range=<range>})")))

(lambda defcommand [name opts ...]
  (assert (string.match (view name) "^%u%w*$"))
  (let [(command opts1) (match ...
                         (nil ? (= (type opts) :string)) (values (opts:gsub "|" "<bar>") {})
                         (body ? (= (type body) :string)) (values (body:gsub "|" "<bar>") opts)
                         _ (values (command-func `(do ,...)) opts))
        flags (translate-opts opts1)]
    `(vim.api.nvim_command (.. "command! " ,flags " " ,(view name) " " ,command))))

;; Exports
{: augroup
 : defcommand
 : env
 : g
 : on
 : opt
 : bopt
 : wopt}
