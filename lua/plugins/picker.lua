return {
  {
    "echasnovski/mini.pick",
    version = false,
    config = function()
      local minipick = require("mini.pick")

      vim.ui.select = minipick.ui_select
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
          -- make a floating centered window
          config = function()
            local height, width, starts, ends
            local win_width = vim.o.columns
            local win_height = vim.o.lines

            if win_height <= 25 then
              height = math.min(win_height, 18)
              width = win_width
              starts = 1
              ends = win_height
            else
              width = math.floor(win_width * 0.7) -- 70%
              height = math.floor(win_height * 0.7) -- 70%
              starts = math.floor((win_width - width) / 2)
              ends = math.floor(win_height * 0.65)
            end

            return {
              col = starts,
              row = ends,
              height = height,
              width = width,
              style = "minimal",
              -- border = { " ", " ", " ", " ", " ", " ", " ", " " },
            }
          end,

          prompt_cursor = "▏",
          prompt_prefix = " ",
        },
      })

      -- Keymaps for files
      vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "[S]earch [F]iles", noremap = true, silent = true }) -- focus file explorer
    end,
  },
}
