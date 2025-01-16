return {
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"

      vim.g.slime_default_config = {
        socket_name = "default", -- Change if using a custom tmux socket
        target_pane = "1", -- Tmux pane where REPL is running
      }

      -- Skip confirmation prompts
      vim.g.slime_dont_ask_default = 1

      -- Optional: Improve compatibility with Python/IPython
      vim.g.slime_python_ipython = 0
      vim.api.nvim_set_keymap("n", "<leader>sc", "<Plug>SlimeRegionSend", { noremap = true })
      vim.api.nvim_set_keymap("v", "<leader>sc", "<Plug>SlimeRegionSend", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>sl", "<Plug>SlimeLineSend", { noremap = true })
    end,
  },
}
