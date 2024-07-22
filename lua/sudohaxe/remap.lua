vim.g.mapleader = " "

-- Explorer remap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Terminal mode escape
vim.api.nvim_set_keymap('t','<ESC>','<C-\\><C-n>',{noremap = true})

-- Trey_bastian's Keymaps
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", {noremap = true})
vim.api.nvim_set_keymap("n", "<Tab>", "v><C-\\><C-N>", {noremap = tr})
vim.api.nvim_set_keymap("n", "<S-Tab>", "v<<C-\\><C-N>", {noremap = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>bn", "<CMD>bn<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>bp", "<CMD>bp<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>bd", "<CMD>bd<CR>", {noremap = true})

--Search and replace current word in normal mode, gc
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], {noremap = true})

-- Remap to open diagnostics in a floating window
vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Remap to set location list with diagnostics
vim.api.nvim_set_keymap('n', '<leader>q', ':lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
