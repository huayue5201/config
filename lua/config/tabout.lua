-- https://github.com/abecodes/tabout.nvim

require("tabout").setup({
	enable_backwards = true, -- well ...
	completion = true, -- if the tabkey is used in a completion pum
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = "`", close = "`" },
		{ open = "(", close = ")" },
		{ open = "[", close = "]" },
		{ open = "{", close = "}" },
		{ open = "#", close = "]" },
	},
})

vim.api.nvim_set_keymap("i", "<A-x>", "<Plug>(TaboutMulti)", { silent = true })
vim.api.nvim_set_keymap("i", "<A-z>", "<Plug>(TaboutBackMulti)", { silent = true })
