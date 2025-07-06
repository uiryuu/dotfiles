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
    { 'nvim-lualine/lualine.nvim',       dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-neo-tree/neo-tree.nvim',     dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' } },
    { 'akinsho/bufferline.nvim',         version = '*',                                                                      dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'kylechui/nvim-surround',          event = 'VeryLazy' },
    { 'tpope/vim-commentary' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'navarasu/onedark.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'romgrk/barbar.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    { 'liuchengxu/vista.vim' },
    { 'lervag/vimtex',                   lazy = false },
    { 'hrsh7th/nvim-cmp',                dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' } },
    { 'chentoast/marks.nvim',            event = 'VeryLazy' },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require('tiny-inline-diagnostic').setup()
        end
   }
}

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = false,
})

vim.o.termguicolors = true

require 'lazy'.setup(plugins, {})

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

require("tiny-inline-diagnostic").setup({
    -- Style preset for diagnostic messages
    -- Available options:
    -- "modern", "classic", "minimal", "powerline",
    -- "ghost", "simple", "nonerdfont", "amongus"
    preset = "powerline",
})

require 'lualine'.setup()
require 'nvim-surround'.setup()
require 'onedark'.load()
require 'onedark'.setup {
    style = 'warm',
}
require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    auto_install = true,
    highlight = {
        enable = true,
    },
}
require 'gitsigns'.setup()

require 'lspconfig'.pyright.setup {}

require'marks'.setup()

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    '${3rd}/luv/library',
                    -- '${3rd}/busted/library',
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file('', true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>F', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

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

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>v', '<Cmd>e $MYVIMRC<CR>', opts)

-- barbar key bindings
map('n', '<leader>w', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

map('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)

map('n', '<leader>q', '<Cmd>ccl<CR>', opts)
map('n', '<C-n>', '<Cmd>nohlsearch<CR>', opts)

map('n', '<C-H>', '<C-w>h', opts)
map('n', '<C-J>', '<C-w>j', opts)
map('n', '<C-K>', '<C-w>k', opts)
map('n', '<C-L>', '<C-w>l', opts)

-- Neotree key bindings

map('n', '<leader>f', '<Cmd>Neotree toggle float filesystem<CR>', opts)
map('n', '<leader>b', '<Cmd>Neotree toggle float buffers<CR>', opts)

-- vista.vim key bindings
map('n', '<leader>t', '<Cmd>Vista!!<CR>', opts)
