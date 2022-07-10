-- https://github.com/nvim-lualine/lualine.nvim

local function keymap()
	if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
		return "⌨ " .. vim.b.keymap_name
	end
	return ""
end

-- 显示窗口编号
local function window()
	return vim.api.nvim_win_get_number(0)
end

-- gitsigns集成
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

-- 根据修改状态更改文件名颜色
local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")
local default_status_colors = { saved = "#228B22", modified = "#C70039" }

function custom_fname:init(options)
	custom_fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ bg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ bg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function custom_fname:update_status()
	local data = custom_fname.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

-- https://github.com/SmiteshP/nvim-navic
local navic = require("nvim-navic")

require("lualine").setup({
	-- gitsigns.nvim
	lualine_b = { { "b:gitsigns_head", icon = "" }, { "diff", source = diff_source } },
	lualine_c = { custom_fname },
	sections = {
		lualine_a = { window },
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
	},
	options = {
		theme = "Tomorrow",
		component_separators = { left = "\\", right = "/" },
		section_separators = { left = "", right = "" },
	},
    -- 扩展添加
	extensions = { "quickfix", "nvim-tree", "toggleterm" },
})
