-- Global options for Neovim

vim.wo.number = true -- make line numbers default (default: false)
vim.o.relativenumber = true -- set relative numbered lines (default: false)
vim.o.clipboard = "unnamedplus" -- sync clipboard between OS and Neovim. (default: '')
vim.o.laststatus = 3 -- make one status line that spans only a the bottom
vim.o.wrap = false -- display lines as one long line (default: true)
vim.o.linebreak = true -- companion to wrap, don't split words (default: false)
vim.o.mouse = "a" -- enable mouse mode (default: '')
vim.o.autoindent = true -- copy indent from current line when starting new one (default: true)
vim.o.ignorecase = true -- case-insensitive searching UNLESS \C or capital in search (default: false)
vim.o.smartcase = true -- smart case (default: false)
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 4 -- insert n spaces for a tab (default: 8)
vim.o.softtabstop = 4 -- number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.expandtab = true -- convert tabs to spaces (default: false)
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor (default: 0)
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
vim.o.cursorline = false -- highlight the current line (default: false)
vim.o.splitbelow = true -- force all horizontal splits to go below current window (default: false)
vim.o.splitright = true -- force all vertical splits to go to the right of current window (default: false)
vim.o.hlsearch = false -- set highlight on search (default: true)
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore (default: true)
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups (default: false)
vim.o.whichwrap = "bs<>[]hl" -- which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.numberwidth = 4 -- set number column width to 2 {default 4} (default: 4)
vim.o.swapfile = true -- creates a swapfile (default: true)
vim.o.smartindent = true -- make indenting smarter again (default: false)
vim.o.showtabline = 2 -- always show tabs (default: 1)
vim.o.backspace = "indent,eol,start" -- allow backspace on (default: 'indent,eol,start')
vim.o.pumheight = 10 -- pop up menu height (default: 0)
vim.o.conceallevel = 0 -- so that `` is visible in markdown files (default: 1)
vim.wo.signcolumn = "yes" -- keep signcolumn on by default (default: 'auto')
vim.o.fileencoding = "utf-8" -- the encoding written to a file (default: 'utf-8')
vim.o.cmdheight = 1 -- more space in the Neovim command line for displaying messages (default: 1)
vim.o.breakindent = true -- enable break indent (default: false)
vim.o.updatetime = 250 -- decrease update time (default: 4000)
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
vim.o.backup = false -- freates a backup file (default: false)
vim.o.writebackup = true -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.o.undofile = true -- save undo history (default: false)
vim.o.completeopt = "menuone,noselect" -- set completeopt to have a better completion experience (default: 'menu,preview')
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches (default: does not include '-')
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
vim.o.foldenable = false
vim.o.foldmethod = "manual"
vim.opt.fillchars:append({ eob = " " }) -- deactivate the ~ on the non-written lines
