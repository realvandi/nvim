local lsp = require('lsp-zero')

lsp.preset('recommended')

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'rust_analyzer', 'eslint'},
    handlers = { function(server_name)
        require('lspconfig')[server_name].setup({
            on_attach = function(client, bufnr)
                    local opts = {buffer = bufnr, remap = false}
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

                    -- Call the formatting function
                    lsp_format_on_save(bufnr)
                end,
            })
        end,
    },
})

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({
                filter = function(client)
                    return client.name == "null-ls"
                end,
                bufnr = bufnr,
            })
        end,
    })
end

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- Call the formatting function
       lsp_format_on_save(bufnr)
end)

lsp.setup()

-- Configure null-ls
local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint, 
        null_ls.builtins.formatting.rustfmt,
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            lsp_format_on_save(bufnr)
        end
    end
})
local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Deprecated LSP configuration
-- lsp.ensure_installed({
-- 	'tsserver',
-- 	'eslint',
-- 	'sumneko_lua',
-- 	'rust_analyzer',
-- })


require('mason').setup({})

require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'tsserver', 'rust_analyzer', 'eslint'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
