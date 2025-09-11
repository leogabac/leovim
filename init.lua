-- load modules
require("core.options") -- ./core/options.lua
require("core.keymaps") -- ./core/keypams.lua
require("core.autocmds") -- ./core/autocmds.lua

-- install lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {

  require("plugins.ui.basic-ui"),
  require("plugins.ui.mini-ui"),

  require("plugins.files.nvim-tree"),
  require("plugins.files.picker"),

  require("plugins.coding.lsp"),
  require("plugins.coding.autocompletion"),
  require("plugins.coding.autoformatting"),
  require("plugins.coding.mini-nvim"),
  require("plugins.coding.treesitter"),

  require("plugins.enhancements.latex"),

  require("plugins.misc"),
}

require("lazy").setup(plugins)

-- something broke in mason-lspconfig
-- that it is ignoring all of my configs
-- ensuring not them being enabled, and forcefully doing it here works
-- bruh

require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        -- disable everything
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pylint = { enabled = false },
        pyflakes = { enabled = false },
        flake8 = { enabled = false },
        mccabe = { enabled = false },
        pydocstyle = { enabled = false },
        rope_autoimport = { enabled = false },
        rope_completion = { enabled = false },
        pylsp_mypy = { enabled = false },
        pylsp_black = { enabled = false },
        pylsp_isort = { enabled = false },

        -- enable only pycodestyle
        pycodestyle = {
          enabled = true,
          maxLineLength = 120,
          ignore = {
            "E402", -- import not at top of file
            "W503", -- line break before binary operator
          },
        },
      },
    },
  },
})

-- Setup ruff-lsp for linting only (no autoformat on save)
require("lspconfig").ruff.setup({
  settings = {
    -- optional: override ruff config here if needed
    -- for example, select rules or line-length
  },
  on_attach = function(client, bufnr)
    -- optional: you can still bind a manual formatting key
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<leader>rf", function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, { buffer = bufnr, desc = "Ruff: Format buffer" })
    end
  end,
})
