-- defines the colorscheme
-- noice.nvim for commandline and messages
-- indent-blankline for indentation scope
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {
            Normal = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            LineNr = { bg = "NONE" },
            EndOfBuffer = { bg = "NONE" },

            -- Git signs / fugitive
            GitGutterAdd = { bg = "NONE" },
            GitGutterChange = { bg = "NONE" },
            GitGutterDelete = { bg = "NONE" },
            GitSignsAdd = { bg = "NONE" },
            GitSignsChange = { bg = "NONE" },
            GitSignsDelete = { bg = "NONE" },

            DiffAdd = { bg = "NONE" },
            DiffChange = { bg = "NONE" },
            DiffDelete = { bg = "NONE" },
          }
        end,
        theme = "wave", -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })

      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa") -- Make sure after colorscheme any leftover background highlights get disabled

    end,
  },
  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline", -- classic cmdline view
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {
        -- do not show written messages, they are annoying
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        -- show @recording as notification
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          stages = "static", -- no animations
        },
      },
    },
  },
  -- indent-blankline
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {
  --     indent = {
  --       char = "▏", -- Light vertical line (use "│" for a bolder look)
  --       highlight = "IblIndent", -- Base indent color (subtle)
  --     },
  --     scope = {
  --       enabled = true,
  --       char = "▎", -- Slightly thicker than indent char
  --       show_start = false, -- No start-of-scope marker
  --       show_end = false, -- No end-of-scope marker
  --       show_exact_scope = true, -- Highlight only the current scope
  --       highlight = "IblScopeCurrent", -- Bright highlight for current scope
  --       -- Optional: Prioritize certain scopes (e.g., functions, loops)
  --       priority = 100, -- Higher than indent priority (default: 50)
  --     },
  --     exclude = {
  --       filetypes = {
  --         "help",
  --         "dashboard",
  --         "neo-tree", -- Disable for UIs
  --         "lazy",
  --         "mason",
  --         "TelescopePrompt", -- Plugin UIs
  --       },
  --       buftypes = { "terminal", "nofile" }, -- Skip non-file buffers
  --     },
  --   },
  --   config = function(_, opts)
  --     -- Set highlight groups (define these in your colorscheme or init.lua)
  --     vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4252", nocombine = true }) -- Dim base indent
  --     vim.api.nvim_set_hl(0, "IblScopeCurrent", { fg = "#5e81ac", bold = true }) -- Bright current scope
  --     vim.api.nvim_set_hl(0, "IblScope", { fg = "#4c566a", nocombine = true }) -- Optional: Non-current scope
  --
  --     require("ibl").setup(opts)
  --   end,
  -- },
  {
    "echasnovski/mini.indentscope",
    version = false, -- use latest
    event = "VeryLazy",
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        draw = {
          delay = 0,
          animation = indentscope.gen_animation.none(),
        },
        symbol = "│", -- character used for guides
        options = { try_as_border = true },
      })
    end,
  },
}
