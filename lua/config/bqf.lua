-- https://gitlab.com/yorickpeterse/nvim-pqf
-- 美化quickfix lsp诊断结果
require("pqf").setup({
	signs = {
		error = " ",
		warning = " ",
		info = " ",
		hint = " ",
	},
})
