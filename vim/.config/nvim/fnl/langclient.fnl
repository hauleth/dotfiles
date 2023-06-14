(import-macros {: use} :relude)

(use nvim {: fun : cmd : opt :buf-map bmap})
(use picker)
(use lspconfig)
(use lspconfig.configs)
(import-macros logger :nvim.logger)
(import-macros {: augroup} :nvim)

(let [lsp vim.lsp
      border :rounded]
  (tset (require :lspconfig.ui.windows) :default_options {:border border})
  (set lsp.handlers.textDocument/hover (lsp.with lsp.handlers.hover {:border border}))
  (set lsp.handlers.textDocument/signatureHelp (lsp.with lsp.handlers.signature_help {:border border}))
  (vim.diagnostic.config {:float {:border border} :virtual_text false}))

; workaround for Lexical to not spit out the snippets params
(let [old vim.lsp.util.parse_snippet]
  (set vim.lsp.util.parse_snippet (fn [input]
                                    (let [result (fun.match input "[^[:keyword:]]")]
                                    (print result)
                                    (input:sub 1 result)))))

(augroup hauleth-lsp
         (on LspAttach "*"
             (let [bufnr args.buf
                   client (vim.lsp.get_client_by_id args.data.client_id)]
               (cmd.packadd! :fidget.nvim)
               ((. (require :fidget) :setup) {})
               (logger.inspect client)
               (local capable?
                      (fn [capability]
                        (. client.server_capabilities capability)))
               (augroup lsp-diagnostics
                        (on CursorHold "*" (vim.diagnostic.open_float {:focus false}))
                        (on BufEnter,CursorHold,InsertLeave "*" (vim.lsp.codelens.refresh)))
               (when (capable? :hoverProvider)
                 (bmap :n :K #(vim.lsp.buf.hover)))
               (when (capable? :declarationProvider)
                 (bmap :n :gD #(vim.lsp.buf.declaration)))
               (when (capable? :referencesProvider)
                 (bmap :n :gr #(picker.lsp_references)))
               (when (capable? :documentFormattingProvider)
                 (bmap :n :Q #(vim.lsp.buf.format)))
               (when (capable? :documentSymbolProvider)
                 (bmap :n :gO #(picker.lsp_document_symbols))))))



(set configs.lexical {
     :default_config {
       :autostart false
       :filetypes ["elixir" "eelixir" "heex"]
       :root_dir (fn [fname]
                   (let [project ((lspconfig.util.root_pattern ".git") fname)]
                         project))}
     })

(set lspconfig.util.default_config
     (vim.tbl_extend :force lspconfig.util.default_config
                     {:autostart false}))


(vim.diagnostic.config {:virtual_text false})

(fn setup [name opts]
  ((. (. lspconfig name) :setup) opts))

(setup :rust_analyzer
       {:settings {:rust-analyzer {:files {:excludeDirs [".direnv"]}}}})

; (setup :elixirls
;        {:cmd [:elixir-ls]
;        :settings {:elixirLS {:dialyzerEnabled false}}})
(setup :lexical
       {:cmd [:lexical :start]})

(setup :erlangls
       {:cmd [:erlang_ls]})

; (setup :rnix
;        {:autostart true})

(augroup lsp-direnv (on User :DirenvLoaded (cmd.LspStart)))
