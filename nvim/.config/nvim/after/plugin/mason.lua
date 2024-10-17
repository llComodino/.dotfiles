require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  ["hls"] = function ()
    require("lspconfig")["hls"].setup{
      cmd = { "/home/comodino/.local/share/nvim/mason/bin/haskell-language-server-9.2.8", "--lsp" },
      filetypes = { "haskell", "lhaskell", "cabal" }
    }
  end,
  ["jdtls"] = function ()
  end
}
