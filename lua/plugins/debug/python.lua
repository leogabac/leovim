local dap = require("dap")

-- Path to the debugpy adapter installed by Mason
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

dap.adapters.python = {
  type = "executable",
  command = mason_path,
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch current file",
    program = "${file}", -- run current buffer
    pythonPath = function()
      local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path then
        return venv_path .. "/bin/python"
      else
        return "python"
      end
    end,
  },
}
