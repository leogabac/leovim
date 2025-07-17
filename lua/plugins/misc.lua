--tandalone plugins with less than 10 lines of config go here
return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = {
        doc = {
          -- floating inline render is annoying in LaTeX
          -- leave it to true is you prefer it
          inline = false,
        },
        math = {
          -- this is the default, but left it explicitely
          -- in case you want to disable math rendering
          -- as it might be annoying sometimes
          enabled = true,
        },
        -- this is mostly default
        latex = {
          font_size = "large",
          -- for latex documents, the doc packages are included automatically,
          -- but you can add more packages here. Useful for markdown documents.
          packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
          tpl = [[
        \documentclass[preview,border=0pt,varwidth,12pt]{standalone}
        \usepackage{${packages}}
        \begin{document}
        ${header}
        { \${font_size} \selectfont
          \color[HTML]{${color}}
        ${content}}
        \end{document}]],
        },
      }
    }
  },
  {
    "nvim-tree/nvim-web-devicons",
    enabled = vim.g.have_nerd_font,
  },
  {
    -- basic setup for latex
    "lervag/vimtex",
    ft = "tex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"

      vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>", { desc = "vimtex-compile" })
      vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "vimtex-clean-aux" })
    end,
  },
  {
    -- Tmux & split window navigation
    "christoomey/vim-tmux-navigator",
  },
  {
    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
  },
  {
    -- Powerful Git integration for Vim
    "tpope/vim-fugitive",
  },
  {
    -- High-performance color highlighter
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- search functionality
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
}
