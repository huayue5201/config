-- https://github.com/AckslD/nvim-neoclip.lua

local function is_whitespace(line)
	return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
	for _, entry in ipairs(tbl) do
		if not check(entry) then
			return false
		end
	end
	return true
end

require("neoclip").setup({
	history = 1000,
	enable_persistent_history = true,
	length_limit = 1048576,
	continuous_sync = false,
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	filter = nil,
	preview = false,
	default_register = '"',
	default_register_macros = "q",
	enable_macro_history = true,
	content_spec_column = true,
	on_paste = {
		set_reg = false,
	},
	on_replay = {
		set_reg = false,
	},
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-p>",
				paste_behind = "<c-k>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				delete = "d",
				custom = {},
			},
		},
        -- 不存储空白的yanks
		filter = function(data)
			return not all(data.event.regcontents, is_whitespace)
		end,
		-- fzf = {
		-- 	select = "default",
		-- 	paste = "ctrl-p",
		-- 	paste_behind = "ctrl-k",
		-- 	custom = {},
		-- },
	},
})

-- lua require('telescope').extensions.macroscope.default() 该命令可以查看存储的宏
