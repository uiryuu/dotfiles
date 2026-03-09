vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = { noremap = true, silent = true }

-- Custom native keybindings
vim.keymap.set("n", "<leader>v", "<cmd>e $MYVIMRC<CR>", opts)

vim.keymap.set("n", "<leader>w", vim.cmd.bdelete, opts)
vim.keymap.set("n", "<leader>,", vim.cmd.bprevious, opts)
vim.keymap.set("n", "<leader>.", vim.cmd.bnext, opts)

vim.keymap.set("n", "<C-q>", vim.cmd.cclose, opts)
vim.keymap.set("n", "<C-l>", vim.cmd.lclose, opts)
vim.keymap.set("n", "<C-n>", vim.cmd.nohlscearch, opts)

vim.keymap.set("n", "<C-H>", "<C-w>h", opts)
vim.keymap.set("n", "<C-J>", "<C-w>j", opts)
vim.keymap.set("n", "<C-K>", "<C-w>k", opts)
vim.keymap.set("n", "<C-L>", "<C-w>l", opts)

-- Custom plugin keybindings

-- neotree
vim.keymap.set("n", "<leader>f", "<cmd>Neotree toggle float filesystem<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle float buffers<CR>", opts)

-- Custom LSP related keybindings (only available after LspAttach)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(args)
    local local_opts = { buffer = args.buf, silent = true }

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, local_opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, local_opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, local_opts)

    -- Info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, local_opts)

    -- Actions
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, local_opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, local_opts)
  end,
})

