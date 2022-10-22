(import-macros {: use} :relude)

(use nvim {: command : opts :buf-map bmap})
(use picker)
(use lspconfig)
(import-macros logger :nvim.logger)
(import-macros {: augroup} :nvim)

(fn on_attach [client]
  (logger.inspect client)
  (local capable?
         (fn [capability]
           (. client.server_capabilities capability)))
  (augroup lsp-diagnostics (on CursorHold "*" (vim.diagnostic.open_float nil)))
  (when (capable? :hoverProvider)
    (bmap :n :K #(vim.lsp.buf.hover)))
  (when (capable? :declarationProvider)
    (bmap :n :gD #(vim.lsp.buf.declaration)))
  (when (capable? :definitionProvider)
    (bmap :n :gd #(vim.lsp.buf.definition)))
  (when (capable? :referencesProvider)
    (bmap :n :gr #(picker.lsp_references)))
  (when (capable? :documentFormattingProvider)
    (bmap :n :Q #(vim.lsp.buf.formatting_sync)))
  (when (capable? :documentSymbolProvider)
    (bmap :n :gO #(picker.lsp_document_symbols)))
  (when (capable? :completionProvider)
    (set opts.buffer.omnifunc "v:lua.vim.lsp.omnifunc")))

(set lspconfig.util.default_config
     (vim.tbl_extend :force lspconfig.util.default_config
                     {:autostart false : on_attach}))

(vim.diagnostic.config {:virtual_text false})

(lspconfig.rust_analyzer.setup {:settings {:trace {:server :verbose}}})

(lspconfig.elixirls.setup {:cmd [:elixir-ls]
                           :settings {:elixirLS {:dialyzerEnabled false}}})

(lspconfig.erlangls.setup {:cmd [:erlang_ls]})

(augroup lsp-direnv (on User :DirenvLoaded (command :LspStart)))
