vim.lsp.enable({ 'lua_ls', 'pyright' })

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = false,
})

vim.o.number = true
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd.colorscheme('onedark')
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.modeline = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 7
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.inccommand = 'split'
vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.completeopt = 'menu'
vim.o.hidden = true
vim.o.clipboard = 'unnamedplus'
vim.o.colorcolumn = '81'
vim.o.encoding = 'utf-8'
vim.o.winborder = 'rounded'
