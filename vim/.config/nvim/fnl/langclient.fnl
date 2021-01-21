(local {:buf_map bmap} (require :utils))
(local lsp (require :lspconfig))

(macro if-capable [client capability body ...]
  (assert body "expected body")
  `(if (. (. ,client :resolved_capabilities) ,capability) (do ,body ,...)))

(fn on-attach [client]
     (if-capable client :hover (bmap :n :K ":lua vim.lsp.buf.hover()"))
     (if-capable client :goto_definition (bmap :n :gd ":lua vim.lsp.definition()"))
     (if-capable client :references (bmap :n :gd ":lua vim.lsp.references()"))
     (vim.api.nvim_buf_set_option 0 :omnifunc "v:lua.vim.lsp.omnifunc"))

(lsp.elixirls.setup {:cmd ["nix-shell" "--show-trace" "--run" "elixir-ls"]
                     :on_attach on-attach})
