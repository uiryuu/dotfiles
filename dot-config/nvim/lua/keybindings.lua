vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = { noremap = true, silent = true }

-- Custom native keybindings
vim.keymap.set('n', '<leader>v', '<cmd>e $MYVIMRC<CR>', { desc = 'Edit nvim config' })

vim.keymap.set('n', '<leader>w', vim.cmd.bdelete, { desc = 'Close the current buffer' })
vim.keymap.set('n', '<leader>,', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>.', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })

vim.keymap.set('n', '<leader>q', function()
    vim.cmd('silent! cclose')
    vim.cmd('silent! lclose')
    vim.cmd('silent! helpclose')
end, { desc = 'Close aux windows' })

vim.keymap.set('n', '<C-n>', vim.cmd.nohlsearch, { desc = 'Disable highlights' })

vim.keymap.set('n', '<C-H>', '<C-w>h', opts)
vim.keymap.set('n', '<C-J>', '<C-w>j', opts)
vim.keymap.set('n', '<C-K>', '<C-w>k', opts)
vim.keymap.set('n', '<C-L>', '<C-w>l', opts)

-- Custom plugin keybindings

vim.keymap.set('n', '<leader>f', require('oil').open_float, { desc = 'Open a floating file explorer' })
vim.keymap.set('n', '<leader>p', '<cmd>BufferLinePick<CR>', { desc = 'Pick a buffer to show' })
vim.keymap.set('n', '<leader>c', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick a buffer to close' })

-- Custom LSP related keybindings (only available after LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspKeymaps', { clear = true }),
    callback = function(args)
        local local_opts = { buffer = args.buf, silent = true }

        -- Navigation
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, local_opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, local_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, local_opts)

        -- Info
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, local_opts)

        -- Actions
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, local_opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, local_opts)
    end,
})

