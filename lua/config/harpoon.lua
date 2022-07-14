-- https://github.com/ThePrimeagen/harpoon
require("harpoon").setup({
	global_settings = {
		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = true,
	},
})
-- 按键配置

vim.cmd([[
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tr :lua require("harpoon.tmux").sendCommand(1, "cargo run")<CR>
]])
