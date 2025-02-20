return {
	{
		"iamcco/markdown-preview.nvim",
		dependencies = {
			"astrand/xclip",
		},
		build = "cd app && npm install",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_browser = "qutebrowser"
			vim.g.mkdp_theme = "dark"
			vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Renders MD in browser" })

		end,
	},
}
