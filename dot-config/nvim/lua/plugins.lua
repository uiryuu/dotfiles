-- Lazy settings
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'tpope/vim-commentary' },
    { 'navarasu/onedark.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-neo-tree/neo-tree.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' } },
    { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'kylechui/nvim-surround', event = 'VeryLazy' },
    { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' },
    { 'rachartier/tiny-inline-diagnostic.nvim', event = 'LspAttach', priority = 1000 },
    { 'saghen/blink.cmp', version = '1.*' },
}

require 'lazy'.setup(plugins, {})

-- Plugin settings
require 'bufferline'.setup()

require 'lualine'.setup { options = { theme = 'onedark' } }
require 'tiny-inline-diagnostic'.setup { preset = 'powerline' }

require 'blink.cmp'.setup {
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = { auto_show = true, auto_show_delay_ms = 500 }
    },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = "prefer_rust_with_warning" }
}
