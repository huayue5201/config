-- https://github.com/nvim-treesitter/nvim-treesitter

-- treesitter配置
require("nvim-treesitter.configs").setup({
	-- 安装的语法解析器
	ensure_installed = { "lua", "vim", "go", "norg", "yaml", "rust", "html", "css", "toml", "javascript" },
	-- 同步安装解析器
	sync_install = true,
	-- 高亮模块启用与配置
	highlight = {
		enable = true,
		-- 使用 treesitter 高亮而不是 neovim 内置的高亮
		-- 此项为true会降低编辑器速度
		additional_vim_regex_highlighting = false,
	},
	-- https://github.com/windwp/nvim-ts-autotag
	autotag = {
		enable = true,
	},
	-- https://github.com/p00f/nvim-ts-rainbow
	-- 彩虹括号
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	-- https://github.com/andymass/vim-matchup/
	-- 突出显示匹配括号
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
		-- [options]
	},
	-- 增量选择模块启用与配置
	incremental_selection = {
		enable = true,
		keymaps = {
			-- 初始化选择
			init_selection = "<CR>",
			-- 递增
			node_incremental = "<CR>",
			-- 递减
			node_decremental = "<BS>",
			-- 选择一个范围
			scope_incremental = "<TAB>",
		},
	},
	-- 基于treesitter的缩进
	indent = {
		enable = false,
	},
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	-- 根据当前上下文定义文件类型，由 nvim-ts-context-commentstring 插件提供
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	-- textobjects功能模块启用与配置
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- 选中整个函数
				["af"] = "@function.outer",
				-- 选中函数内部
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		-- 将光标下的节点与下一个或上一个节点交换,像函数参数
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				-- 跳转到下一个函数头
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				-- 跳转到下一个函数尾
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			-- 跳转到上一个函数头
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			-- 跳转到上一个函数尾
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
	},
})
-- -- 开启 Folding
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- :TSBufEnable {module}  当前缓冲区启用模块
-- :TSBufDisable {module} 当前缓冲区禁用模块
-- :TSEnable {module} [{ft}] " enable module on every buffer. If filetype is specified, enable only for this filetype.
-- :TSDisable {module} [{ft}] " disable module on every buffer. If filetype is specified, disable only for this filetype.
-- :TSModuleInfo [{module}] " list information about modules state for each filetype
