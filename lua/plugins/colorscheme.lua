return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local onedark = require("onedarkpro")

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
				vim.api.nvim_set_hl(0, "Normal", { bg = "#282c34" }) -- OneDark default
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282c34" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#282c34" })
			end

			-- Keep floating windows opaque
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e222a", fg = "#565f89" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" }) -- Keep SignColumn transparent
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" }) -- Transparent end-of-buffer symbols
			-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e222a" }) -- Solid background for Telescope
			-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1e222a", fg = "#565f89" }) -- Telescope border
			-- Add a solid background for the bufferline
			-- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#1e222a" })
			-- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "#1e222a", fg = "#565f89" })
			-- vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "#1e222a", fg = "#282c34" })
		end

		-- Initial theme setup
		apply_theme()

		-- Toggle background transparency with a keybinding
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			apply_theme()
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
	end,
}
