-- https://github.com/uga-rosa/translate.nvim
-- 依赖外部程序 translate-shell
-- WARN:https://github.com/soimort/translate-shell

-- 翻译配置
-- deepl翻译引擎API
-- vim.g.deepl_api_auth_key = "2a396fac-bb46-9cf2-d1ec-20f47b12df45:fx"

require("translate").setup({
	default = {
		command = "translate_shell",
		output = "floating",
		parse_after = "no_handle",
		parse_before = "trim",
	},
	preset = {
		output = {
			split = {
				min_size = 8,
			},
		},
	},
})

-- translate翻译按键
vim.keymap.set("v", "<leader>tl", ":Translate ZH -source=EN -parse_after=window -output=floating<CR>")
vim.keymap.set("n", "<leader>tl", ":Translate ZH -source=EN -parse_after=window -output=floating<CR>")
