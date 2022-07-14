-- https://github.com/ThePrimeagen/harpoon
require("harpoon").setup({
	global_settings = {
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = true,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "harpoon" },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,
	},
	projects = {
		-- Yes $HOME works
		["$HOME/personal/vim-with-me/server"] = {
			term = {
				cmds = {
					"./env && npx ts-node src/index.ts",
				},
			},
		},
	},
})
-- 按键配置

vim.cmd([[
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><leader>tb :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tr :lua require("harpoon.tmux").sendCommand(1, "cargo run")<CR>
]])
