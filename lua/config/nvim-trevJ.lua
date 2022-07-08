-- https://github.com/AckslD/nvim-trevJ.lua

require("trevj").setup({
	containers = {
		lua = {
			table_constructor = { final_separator = ",", final_end_line = true },
			arguments = { final_separator = false, final_end_line = true },
			parameters = { final_separator = false, final_end_line = true },
		},
	},
})

vim.keymap.set("n", "<leader>j", "<cmd>lua require('trevj').format_at_cursor()<cr>")
