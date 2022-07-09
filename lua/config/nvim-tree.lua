-- https://github.com/kyazdani42/nvim-tree.lua

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		-- 自适应大小
		adaptive_size = true,
		-- 按键映射
		-- 列号数字
		number = false,
		-- 相对列号
		relativenumber = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		-- 位置
		side = "right",
	},
	renderer = {
		add_trailing = true,
		group_empty = true,
		highlight_git = true,
		full_name = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = true,
	},
})

-- tree是最后一个窗口时自动关闭
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})
