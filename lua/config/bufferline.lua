-- https://github.com/akinsho/bufferline.nvim

require("bufferline").setup({
	options = {
		-- 侧边栏偏移设置
		offsets = {
			{
				filetype = "NvimTree",
				text = "  File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
			{
				filetype = "SidebarNvim",
				text = "  Sidebar",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
