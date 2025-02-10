return {
  -- KANAGAWA
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme kanagawa-wave")
  --   end,
  -- },
  -- MODUS
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme modus")
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })

      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" }) -- Keeps main UI transparent
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" }) -- Inactive windows
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" }) -- Floating windows (affects mini.pick)
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" }) -- Borders for floating windows
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" }) -- Popup menus (completion, mini.pick)
    end,
  },
}
