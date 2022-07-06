-- https://github.com/lukas-reineke/indent-blankline.nvim

-- 禁用插件
-- vim.g.indent_blankline_enabled = false
-- 开启文间禁用效果
vim.g.indent_blankline_disable_with_nolist = true
-- vim.g.indent_blankline_filetype = { "norg" }
-- 禁用稳健类型列表
vim.g.indent_blankline_filetype_exclude = { "norg", "md" }
-- 尽可能使用trersitter计算缩进
vim.g.indent_blankline_use_treesitter = true
-- 缩进线主题配置
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
