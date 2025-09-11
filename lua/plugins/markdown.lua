-- plugins for dealing with markdown previewing, and nice features
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
  -- paste images from clipboard
  -- TODO: make it paste the relative directory of the image instead, as this is useful for latex-based workflows
  {
    "TobinPalmer/pastify.nvim",
    cmd = { "Pastify", "PastifyAfter" },
    config = function()
      require("pastify").setup({
        opts = {
          apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
        },
      })
      vim.keymap.set("n", "<leader>pi", ":Pastify<CR>", { desc = "[P]aste [I]mage" })
    end,
  },
  -- automate table of content
  {
    "mzlogin/vim-markdown-toc",
    ft = "markdown",
  },
}
