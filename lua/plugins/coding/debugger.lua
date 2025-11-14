return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("nvim-dap-virtual-text").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "debugpy" },
        automatic_installation = true,
      })

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      -- Load Python config
      require("plugins.debug.python")

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<F5>", function()
        dap.continue()
      end, opts) -- Start / Continue

      map("n", "<F9>", function()
        dap.toggle_breakpoint()
      end, opts) -- Toggle breakpoint

      map("n", "<F10>", function()
        dap.step_over()
      end, opts) -- Step over

      map("n", "<F11>", function()
        dap.step_into()
      end, opts) -- Step into

      map("n", "<F12>", function()
        dap.step_out()
      end, opts) -- Step out

      map("n", "<leader>db", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, opts)

      map("n", "<leader>dr", function()
        dap.repl.open()
      end, opts)

      map("n", "<leader>dl", function()
        dap.run_last()
      end, opts)

      map("n", "<leader>du", function()
        dapui.toggle()
      end, opts)

      map("n", "<leader>dv", function()
        require("dap.ui.widgets").hover()
      end, opts) -- Inspect variable under cursor
    end,
  },
}
