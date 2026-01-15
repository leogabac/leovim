return {
  {
    -- Powerful Git integration for Vim
    "lewis6991/gitsigns.nvim",
  },
  {
    -- more Git integration for Vim
    "tpope/vim-fugitive",
  },
  {
    "SuperBo/fugit2.nvim",
    build = false,
    opts = {
      width = 100,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
        dependencies = { "stevearc/dressing.nvim" },
      },
    },
    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    keys = {
      { "<leader>g", mode = "n", "<cmd>Fugit2<cr>" },
    },
  },
}
