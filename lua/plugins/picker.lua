return {
  {
    "echasnovski/mini.pick",
    version = false,
    config = function()
      local minipick = require("mini.pick")
      minipick.setup({
        mappings = {
          caret_left = "<Left>",
          caret_right = "<Right>",

          choose = "<CR>",
          choose_in_split = "<C-s>",
          choose_in_tabpage = "<C-t>",
          choose_in_vsplit = "<C-v>",
          choose_marked = "<M-CR>",

          delete_char = "<BS>",
          delete_char_right = "<Del>",
          delete_left = "<C-u>",
          delete_word = "<C-w>",

          mark = "<C-x>",
          mark_all = "<C-a>",

          move_down = "<C-j>",
          move_start = "<C-g>",
          move_up = "<C-k>",

          paste = "<C-r>",

          refine = "<C-Space>",
          refine_marked = "<M-Space>",

          scroll_down = "<C-f>",
          scroll_left = "<C-h>",
          scroll_right = "<C-l>",
          scroll_up = "<C-b>",

          stop = "<Esc>",

          toggle_info = "<S-Tab>",
          toggle_preview = "<Tab>",
        },
        options = {
          -- Whether to show content from bottom to top
          content_from_bottom = true,

          -- Whether to cache matches (more speed and memory on repeated prompts)
          use_cache = false,
        },
        window = {
          config = function()
            local width = math.floor(vim.o.columns * 0.6) -- 60% of screen width
            local height = math.floor(vim.o.lines * 0.6) -- 60% of screen height
            local row = math.floor((vim.o.lines - height) / 2) -- Center vertically
            local col = math.floor((vim.o.columns - width) / 2) -- Center horizontally
            return {
              relative = "editor",
              width = width,
              height = height,
              row = row,
              col = col,
              border = "rounded", -- You can change this to 'single', 'double', etc.
            }
          end,

          backdrop = 100,
          prompt_cursor = "▏",
          prompt_prefix = "> ",
        },
      })

      vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "[S]earch [F]iles", noremap = true, silent = true }) -- focus file explorer
    end,
  },
}
