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
    { 'navarasu/onedark.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'kylechui/nvim-surround', event = 'VeryLazy' },
    { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' },
    { 'rachartier/tiny-inline-diagnostic.nvim', event = 'LspAttach', priority = 1000 },
    { 'saghen/blink.cmp', version = '1.*' },
    { 'folke/which-key.nvim', event = 'VeryLazy' },
    { 'stevearc/oil.nvim', dependencies = { 'nvim-mini/mini.icons' }, lazy = false },
    { 'benomahony/oil-git.nvim', dependencies = { 'stevearc/oil.nvim' } },
    { 'matbme/jabs.nvim' },
}

require 'lazy'.setup(plugins, {})

-- Plugin settings
require 'jabs'.setup {}
require 'tiny-inline-diagnostic'.setup { preset = 'powerline' }

require 'lualine'.setup {
    options = { theme = 'onedark' },
    sections = {
        lualine_c = {
            { 'filename', path = 2 }
        }
    }
}

require 'bufferline'.setup {
    options = {
        separator_style = 'slant',
    }
}

require 'oil'.setup {
    default_file_explorer = true,
    columns = { 'icon' },
    float = {
        max_width = 0.6,
        max_height = 0.6,
        win_options = { winblend = 1 },
    }
}

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
