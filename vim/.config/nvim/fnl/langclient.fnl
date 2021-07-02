(local {:buf-map bmap} (require :nvim))
(local lsp (require :lspconfig))
(local utils (require :lspconfig.util))
(local picker (require :picker))
(import-macros logger :nvim.logger)
(import-macros {: bopt} :nvim.macros)

(require :lspconfig.erlangls)

(fn capable? [client capability]
  (. client.resolved_capabilities capability))

(fn on-attach [client]
  (logger.inspect client)
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

(fn nix-cmd [name cmd]
  ["nix-shell"
   "-E" (.. "with import <nixpkgs> {}; with (if (builtins.pathExists ./shell.nix) then (import ./shell.nix {}).passthru else (import <nixpkgs> {})); mkShell { buildInputs = [" name "]; }")
   "--run" (or cmd name)])

(lsp.rust_analyzer.setup {:cmd (nix-cmd "rust-analyzer")
                          :on_attach on-attach})

(lsp.elixirls.setup {:cmd (nix-cmd "elixir_ls" "elixir-ls")
                     :on_attach on-attach
                     :settings {:elixirLS {:dialyzerEnabled false}}})

(lsp.erlangls.setup {:cmd (nix-cmd "erlang-ls" "erlang_ls")
                     :on_attach on-attach})

(lsp.solargraph.setup {:on_attach on-attach})
