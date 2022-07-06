-- https://github.com/kevinhwang91/nvim-hlslens

vim.keymap.set("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
vim.keymap.set("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]])
vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]])
vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]])
vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]])

vim.keymap.set("n", "<Leader>l", ":noh<CR>")

-- mg979/vim-visual-multi集成
vim.cmd([[
    aug VMlens
        au!
        au User visual_multi_start lua require('vmlens').start()
        au User visual_multi_exit lua require('vmlens').exit()
    aug END
]])
