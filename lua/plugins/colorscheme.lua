return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local onedark = require("onedarkpro")
    local colors = require("onedarkpro.helpers").get_colors()

    -- Define the initial state of background transparency
    local bg_transparent = false

    -- Function to apply theme and customize highlights
    local apply_theme = function()
      onedark.setup({
        options = {
          transparency = bg_transparent, -- Enable or disable transparency
        },
      })
      vim.cmd.colorscheme("onedark")

      -- Apply selective transparency
      if bg_transparent then
        -- Transparent background for main editor
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
      else
        -- Restore solid background
        vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg }) -- OneDark default
        vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.bg })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = colors.bg })
      end
      -- -- Keep floating windows opaque
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
      -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e222a", fg = "#565f89" })
      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" }) -- Keep SignColumn transparent
      -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" }) -- Transparent end-of-buffer symbols
    end

    -- Initial theme setup
    apply_theme()

    -- Toggle background transparency with a keybinding
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      apply_theme()
    end

    vim.keymap.set(
      "n",
      "<leader>bg",
      toggle_transparency,
      { desc = "Toggle background transparency", noremap = true, silent = true }
    )
  end,
}
