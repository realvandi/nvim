vim.g.mapleader = " "

-- Explorer remap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Terminal mode escape
vim.api.nvim_set_keymap('t','<ESC>','<C-\\><C-n>',{noremap = true})
