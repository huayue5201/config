-- https://github.com/ThePrimeagen/harpoon
require("harpoon").setup({
	global_settings = {
		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = true,
	},
})
-- 按键配置

vim.cmd([[
" 标记该buffer
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
" 管理项目标签
nnoremap <silent><leader>tm :lua require("harpoon.ui").toggle_quick_menu()<CR>
" rust一键运行
nnoremap <silent><leader>ru :lua require("harpoon.tmux").sendCommand(1, "cargo run")<CR>
]])
