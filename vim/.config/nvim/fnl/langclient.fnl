(local {:buf-map bmap} (require :nvim))
(local lsp (require :lspconfig))
(local utils (require :lspconfig.util))
(local picker (require :picker))
(import-macros logger :nvim.logger)
(import-macros {: bopt
                : augroup
                : on} :nvim.macros)

(fn capable? [client capability]
  (. client.resolved_capabilities capability))

; Disable virtual text for diagnostics
(tset vim.lsp.handlers :textDocument/publishDiagnostics
 (vim.lsp.with
  vim.lsp.diagnostic.on_publish_diagnostics
  {:virtual_text false
   :underline true
   :signs true}))

(fn on_attach [client]
  (logger.inspect client)
  (augroup lsp-diagnostics
           (on CursorHold  :* (vim.diagnostic.open_float nil)))
  (when (capable? client :hover)
    (bmap :n :K #(vim.lsp.buf.hover)))
  (when (capable? client :goto_definition)
    (bmap :n :gd #(vim.lsp.buf.definition)))
  (when (capable? client :find_references)
    (bmap :n :gr #(picker.lsp_references)))
  (when (capable? client :document_formatting)
    (bmap :n :Q #(vim.lsp.buf.formatting_sync)))
  (when (capable? client :document_symbol)
    (bmap :n :gO #(picker.lsp_document_symbols)))
  (when (capable? client :completion)
    (bopt omnifunc "v:lua.vim.lsp.omnifunc")))

(local capabilities
  (->> (vim.lsp.protocol.make_client_capabilities)
      ((. (require :cmp_nvim_lsp) :update_capabilities))))

(lsp.rust_analyzer.setup {: capabilities
                          : on_attach
                          :settings {
                            :trace {:server :verbose}
                          }})

(lsp.elixirls.setup {:cmd ["elixir-ls"]
                     : capabilities
                     : on_attach
                     :settings {:elixirLS {:dialyzerEnabled false}}})

(lsp.erlangls.setup {:cmd ["erlang_ls"]
                     : capabilities
                     : on_attach})

(lsp.solargraph.setup {: on_attach})
