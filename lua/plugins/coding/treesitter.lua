return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        enable = true, -- Enable context window
        max_lines = 5, -- Maximum lines to show
        trim_scope = "outer", -- Keeps outer scope in view if too long
        min_window_height = 0,
        patterns = {
          default = {
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
          },
        },
        separator = "─",
      },
    },
  },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "python",
    },
    auto_install = false,
    highlight = {
      enable = true,
      disable = { "latex", "cpp", "c" },
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "ruby" } },
  },
}
