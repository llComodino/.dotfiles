require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.c3 = {
    install_info = {
      url = "https://github.com/c3lang/tree-sitter-c3",
      files = {"src/parser.c", "src/scanner.c"},
      branch = "main",
    },
  }
