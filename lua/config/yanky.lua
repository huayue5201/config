-- https://github.com/gbprod/yanky.nvim

require("yanky").setup({
	ring = {
		history_length = 10,
		storage = "shada",
		sync_with_numbered_registers = true,
	},
	system_clipboard = {
		sync_with_ring = true,
	},
	preserve_cursor_position = {
		enabled = true,
	},
})

vim.keymap.set("n", "y", "<Plug>(YankyYank)", {})
vim.keymap.set("x", "y", "<Plug>(YankyYank)", {})

vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

vim.keymap.set("n", "<a-n>", "<Plug>(YankyCycleForward)", {})
vim.keymap.set("n", "<a-p>", "<Plug>(YankyCycleBackward)", {})
