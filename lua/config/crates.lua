-- https://github.com/Saecki/crates.nvim

local null_ls = require("null-ls")

require("crates").setup({
	src = {
		-- 给coq补全提供源
		coq = {
			enabled = true,
			name = "crates.nvim",
		},
	},
	-- null集成
	null_ls = {
		enabled = true,
		name = "crates.nvim",
	},
})
