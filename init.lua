local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
}

require("lazy").setup(plugins, {})

vim.o.number = true
vim.o.background = 'dark'
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
--vim.o.laststatus = 2

vim.cmd.colorscheme 'catppuccin-frappe'

vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.completeopt = "menu"
vim.o.hidden = true
vim.o.clipboard = 'unnamedplus'
vim.o.colorcolumn = 81
vim.o.encoding = "utf-8"

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.api.nvim_set_keymap('n', '<leader>v', ':e $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':bd!<CR>', { noremap = true, silent = true })

for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<Leader>' .. i, ':buffer ' .. i .. '<CR>', { noremap = true, silent = true })
end

vim.api.nvim_set_keymap('n', ',,', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '..', ':bn<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>c', '<C-w>c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':ccl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':nohlsearch<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-H>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-w>l', { noremap = true, silent = true })

local function remove_trailing_whitespace()
    local save_cursor = vim.api.nvim_win_get_cursor(0)  -- Save cursor position
    vim.cmd([[ %s/\s\+$//e ]])  -- Remove trailing whitespace
    vim.api.nvim_win_set_cursor(0, save_cursor)  -- Restore cursor position
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",  -- Applies to all files
    callback = remove_trailing_whitespace,
})

local function disable_relative_number()
    vim.opt.relativenumber = false
end

local function enable_relative_number()
    vim.opt.relativenumber = true
end

local group = vim.api.nvim_create_augroup("RelativeNumberToggle", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
    group = group,
    pattern = "*",
    callback = enable_relative_number,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = group,
    pattern = "*",
    callback = disable_relative_number,
})

