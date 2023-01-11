(import-macros {: use} :relude)

(use nvim {: cmd : opt :buf-map bmap})
(use picker)
(use lspconfig)
(import-macros logger :nvim.logger)
(import-macros {: augroup} :nvim)

(fn on_attach [client]
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
    (bmap :n :gO #(picker.lsp_document_symbols))))

(set lspconfig.util.default_config
     (vim.tbl_extend :force lspconfig.util.default_config
                     {:autostart false : on_attach}))

(vim.diagnostic.config {:virtual_text false})

(fn setup [name opts]
  ((. (. lspconfig name) :setup) opts))

(setup :rust_analyzer
       {:settings {:rust-analyzer {:files {:excludeDirs [".direnv"]}}}})

(setup :elixirls
       {:cmd [:elixir-ls]
        :settings {:elixirLS {:dialyzerEnabled false}}})

(setup :erlangls
       {:cmd [:erlang_ls]})

(setup :rnix
       {:autostart true})

(augroup lsp-direnv (on User :DirenvLoaded (cmd.LspStart)))
