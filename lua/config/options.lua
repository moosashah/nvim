vim.opt.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
vim.opt.hlsearch = true           -- highlight all matches on previous search pattern
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0           -- always show tabs
vim.opt.smartcase = true          -- smart case
vim.opt.smartindent = true        -- make indenting smarter again
vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
vim.opt.undofile = true           -- enable persistent undo
vim.opt.expandtab = true          -- convert tabs to spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true     -- set numbered lines
vim.opt.relativenumber = true
vim.opt.signcolumn = 'no' -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 15
vim.opt.ruler = false
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.iskeyword:append('-')
vim.cmd("Copilot disable")
