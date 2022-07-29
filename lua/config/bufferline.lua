-- https://github.com/akinsho/bufferline.nvim

require("bufferline").setup({
	options = {
		-- 侧边栏偏移设置
		offsets = {
			{
				filetype = "NvimTree",
				text = " File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
			{
				filetype = "SidebarNvim",
				text = " Sidebar",
				highlight = "Directory",
				text_align = "left",
			},
		},
		-- lsp支持
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			if context.buffer:current() then
				return ""
			end
			return ""
		end,

		-- 忽略掉的buffer名称
		-- custom_filter = function(buf_number, buf_numbers)
		-- 	if vim.fn.bufname(buf_number) ~= { "term", "dap-repl" } then
		-- 		return true
		-- 	end
		-- end,
	},
})
