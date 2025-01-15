-- load modules
require("core.options") -- ./core/options.lua
require("core.keymaps") -- ./core/keypams.lua
require("core.autocmds") -- ./core/autocmds.lua
require("custom.example")

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
  -- plugins for aesthetics
  require("plugins.alpha"),
  require("plugins.colorscheme"),
  require("plugins.mini-ui"),
  require("plugins.noice-classic"),

  -- general programming utilities
  -- require("plugins.treesitter"),
  require("plugins.neotree"),
  require("plugins.telescope"),

  require("plugins.lsp"),
  require("plugins.autocompletion"),
  require("plugins.autoformatting"),
  require("plugins.indent-blankline"),

  require("plugins.flash"),
  -- require("plugins.code-runner"),

  require("plugins.misc"),
  -- require("plugins.markdown-setup"),
}

if vim.env.MARKDOWN then
  table.insert(plugins, require("plugins.markdown-setup"))
end

require("lazy").setup(plugins)

