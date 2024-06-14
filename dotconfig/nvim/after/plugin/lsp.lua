local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer'
})


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>lx', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)
    end,
})

-- CONFIG
local config = require('lspconfig')

lsp.setup()
