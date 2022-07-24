-- https://github.com/wbthomason/packer.nvim

_ = vim.cmd([[packadd packer.nvim]])
_ = vim.cmd([[packadd vimball]])

local has = function(x)
	return vim.fn.has(x) == 1
end

local executable = function(x)
	return vim.fn.executable(x) == 1
end

local is_wsl = (function()
	local output = vim.fn.systemlist("uname -r")
	return not not string.find(output[1] or "", "WSL")
end)()

local is_mac = has("macunix")
local is_linux = not is_wsl and not is_mac

local max_jobs = nil
if is_mac then
	max_jobs = 32
end

return require("packer").startup({
	function(use)
		local local_use = function(first, second, opts)
			opts = opts or {}

			local plug_path, home
			if second == nil then
				plug_path = first
				home = "tjdevries"
			else
				plug_path = second
				home = first
			end

			if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
				opts[1] = "~/plugins/" .. plug_path
			else
				opts[1] = string.format("%s/%s", home, plug_path)
			end

			use(opts)
		end

		local py_use = function(opts)
			if not has("python3") then
				return
			end

			use(opts)
		end

		------------------------------------------------------------|
		-----------------| 插件书写在下面 |-------------------------|
		------------------------------------------------------------|

		-- WARN::新加载插件需要把init.lua第一行注释掉,
		--https://github.com/lewis6991/impatient.nvim
		-- 加快启动时间
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient").enable_profile()
			end,
		})

		-- https://github.com/nathom/filetype.nvim
		-- 该插件加快启动速度
		use({
			"nathom/filetype.nvim",
			config = function()
				require("config.filetype")
			end,
		})

		-- 多个插件依赖该模块(官方)
		use({ "nvim-lua/plenary.nvim" })

		--  Neovim中来自vim的Popup API的实现(官方)
		use({ "nvim-lua/popup.nvim" })

		-- 图标支持,很多插件依赖该插件
		use({ "kyazdani42/nvim-web-devicons" })

		---------------------------UI 视觉-----------------------------
		---------------------------------------------------------------

		-- https://github.com/Mofiqul/dracula.nvim
		-- 主题
		use({
			"Mofiqul/dracula.nvim",
			config = function()
				-- lualine背景色
				vim.g.dracula_lualine_bg_color = "#4B0082"
				-- 透明背景
				vim.g.dracula_transparent_bg = true
				vim.cmd([[
				colorscheme dracula
                ]])
			end,
		})

		-- 状态栏
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("config.lualine")
			end,
		})

		-- Tab栏
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			-- https://github.com/famiu/bufdelete.nvim
			-- 删除缓冲区不打乱布局
			requires = { "famiu/bufdelete.nvim" },
			tag = "v2.*",
			config = function()
				require("config.bufferline")
			end,
		})

		-- nvim输出消息的弹窗 UI
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("config.nvim-notify")
			end,
		})

		-- 更好用的quickfix窗口,通过fzf提供模糊搜索功能
		use({
			"kevinhwang91/nvim-bqf",
			ft = "qf",
			requires = {
				{ "junegunn/fzf" },
				run = function()
					vim.fn["fzf#install"]()
				end,
			},
			config = function()
				require("config.nvim-bqf")
			end,
		})

		------------------------treesitter相关----------------------
		------------------------------------------------------------

		-- treesitter高亮组件（官方）
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.nvim-treesitter")
			end,
		})

		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		-- 基于treesitter的文本操作模块(官方)
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })

		-- 突出显示匹配符号并提供额外的操作符
		-- https://github.com/andymass/vim-matchup/
		use({
			"andymass/vim-matchup",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			event = "InsertEnter *",
			config = function()
				vim.g.matchup_surround_enabled = 0 -- 禁用符号删改操作（1启用）
				vim.g.matchup_delim_noskips = 1 -- recognize symbols within comments
				vim.g.matchup_delim_noskips = 2 -- don't recognize anything in comments
				vim.g.matchup_matchparen_deferred = 1 -- 延时突出显示，提高光标移动性能
				vim.cmd([[
				let g:matchup_matchparen_offscreen = {'method': 'popup'}
				]])
				-- -- 突出显示周围符号
				-- vim.g.matchup_matchparen_deferred = 1
				-- vim.g.matchup_matchparen_hi_surround_always = 1
			end,
		})

		-- 和J拼接反向操作
		use({
			"AckslD/nvim-trevJ.lua",
			keys = "<leader>j",
			config = function()
				require("config.nvim-trevJ")
			end,
		})

		-- 更好的折叠机制
		use({
			"kevinhwang91/nvim-ufo",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			keys = { "zR", "zM" },
			requires = "kevinhwang91/promise-async",
			config = function()
				require("config.nvim-ufo")
			end,
		})

		-------------------------------文本操作--------------------------------
		---------------------------------------------------------------------

		-- https://github.com/mg979/vim-visual-multi
		-- 多光标
		use({
			"mg979/vim-visual-multi",
			keys = { "<c-n>", "<c-Down>", "<c-Up>", "<s-Up>", "<s-Down>", "<s-Left>", "<s-Right>" },
		})

		-- 显示缩进线
		use({
			"lukas-reineke/indent-blankline.nvim",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			config = function()
				require("config.blankline")
			end,
		})

		-- 自动缩进
		use({
			"Darazaki/indent-o-matic",
			event = "InsertEnter *",
			cofnig = function()
				require("config.indent-o-matic")
			end,
		})

		-- 代码注释
		use({
			"numToStr/Comment.nvim",
			keys = { "gc", "gb", "gcc", "gbc", "gc0", "gco", "gcA" },
			requires = {
				-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
				-- 根据上下文提供不同的注释方案
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				require("config.Comment")
			end,
		})

		-- https://github.com/kylechui/nvim-surround
		-- 环绕符号 快捷键：
		use({
			"kylechui/nvim-surround",
			keys = { "ys", "yss", "cs", "ds", "V" },
			config = function()
				require("config.nvim-surround")
			end,
		})

		-- 颜色编码渲染
		use({
			"norcalli/nvim-colorizer.lua",
			cmd = { "ColorizerToggle" },
			config = function()
				require("config.nvim-colorizer")
			end,
		})

		-------------------------------移动----------------------------------
		---------------------------------------------------------------------

		-- tab跳出符号包围
		-- use({
		-- 	"abecodes/tabout.nvim",
		-- 	wants = { "nvim-treesitter" }, -- or require if not used so far
		-- 	after = { "coq_nvim" }, -- if a completion plugin is using tabs load it before
		-- 	config = function()
		-- 		require("config.tabout")
		-- 	end,
		-- })

		-- 平滑滚动
		use({
			"declancm/cinnamon.nvim",
			config = function()
				require("config.cinnamon")
			end,
		})

		-- 光标快速跳转
		use({
			"ggandor/leap.nvim",
			keys = { "f", "t" },
			requires = { "tpope/vim-repeat" },
			config = function()
				require("config.leap")
			end,
		})

		----------------------------telescope相关--------------------------
		-------------------------------------------------------------------

		-- 模糊搜索
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				-- fzf算法组件(由c实现)
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			},
			config = function()
				require("config.telescope")
			end,
		})

		-- WARN:需要安装sqlite
		-- https://github.com/tami5/sqlite.lua
		-- 使用Mozilla的Frecency算法从编辑历史中选择文件时提供智能优先级
		use({ "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } })

		-- 项目管理
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("config.project")
			end,
		})

		-- TODO/PERF/HACK/FIX/WARNING搜索管理
		use({
			"folke/todo-comments.nvim",
			config = function()
				require("config.todo-comments")
			end,
		})

		-- 寄存器历史搜索与管理
		use({
			"acksld/nvim-neoclip.lua",
			requires = { "kkharji/sqlite.lua", module = "sqlite" },
			config = function()
				require("config.nvim-neoclip")
			end,
		})

		-- 更好的浏览/?匹配结果
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("config.hlslens")
			end,
		})

		-- 项目书签
		use({
			"ThePrimeagen/harpoon",
			config = function()
				require("config.harpoon")
			end,
		})

		------------------------------LSP相关-------------------------------
		--------------------------------------------------------------------

		-- LSP基础组件（官方）
		use({
			"neovim/nvim-lspconfig",
			-- ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			config = function()
				require("config.nvim-lspconfig")
			end,
		})

		-- https://github.com/onsails/lspkind.nvim
		-- lsp插件图标集
		use({ "onsails/lspkind.nvim", after = { "nvim-lspconfig" } })

		-- 代码大纲
		use({
			"stevearc/aerial.nvim",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			after = { "nvim-lspconfig" },
			config = function()
				require("config.aerial")
			end,
		})

		-- https://github.com/simrat39/rust-tools.nvim
		-- rust LSP开发组件
		use({ "simrat39/rust-tools.nvim" })

		-- 代码操作标志💡
		use({
			"kosayoda/nvim-lightbulb",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			-- https://github.com/antoinemadec/FixCursorHold.nvim
			-- 解决一个nvovim的设计bug
			requires = "antoinemadec/FixCursorHold.nvim",
			config = function()
				require("config.nvim-lightbulb")
			end,
		})

		-- 代码操作UI
		use({
			"weilbith/nvim-code-action-menu",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			cmd = "CodeActionMenu",
			config = function()
				vim.g.code_action_menu_window_border = "single"
			end,
		})

		-- lsp重构重命名组件
		-- use({
		-- 	"smjonas/inc-rename.nvim",
		-- 	config = function()
		-- 		require("inc_rename").setup()
		-- 	end,
		-- })

		-- https://github.com/ray-x/lsp_signature.nvim
		-- 签名帮助
		use({
			"ray-x/lsp_signature.nvim",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			event = "InsertEnter *",
		})

		-- 集成非LSP模块之外的诊断,格式化,代码操作功能
		use({
			"jose-elias-alvarez/null-ls.nvim",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			config = function()
				require("config.null-ls")
			end,
		})

		-- LSP 加载进度UI
		use({
			"j-hui/fidget.nvim",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			config = function()
				require("config.fidget")
			end,
		})

		-- https://github.com/SmiteshP/nvim-navic
		-- 一个简单的状态栏/winbar 组件，它使用 LSP 来显示您当前的代码上下文
		use({ "SmiteshP/nvim-navic" })

		-----------------------------补全-----------------------------
		--------------------------------------------------------------

		-- https://github.com/ms-jpq/coq_nvim/blob/coq/docs/DISPLAY.md
		-- coq补全引擎
		use({
			"ms-jpq/coq_nvim",
			event = "InsertEnter *",
			after = { "nvim-lspconfig" },
			run = "python3 -m coq deps",
			requires = {
				{ "ms-jpq/coq.artifacts" },
				{ "ms-jpq/coq.thirdparty" },
			},
		})

		-- 括号补全
		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter *",
			config = function()
				require("config.nvim-autopairs")
			end,
		})

		-- 命令模式补全
		use({
			"gelguy/wilder.nvim",
			keys = { "/", "?", ":" },
			requires = {
				-- https://github.com/romgrk/fzy-lua-native
				{ "romgrk/fzy-lua-native" },
			},
			config = function()
				require("config.wilder")
			end,
		})

		-- https://github.com/windwp/nvim-ts-autotag
		-- 自动关闭和自动重命名html标签
		use({ "windwp/nvim-ts-autotag", event = "InsertEnter *" })

		-- https://github.com/Saecki/crates.nvim
		-- 帮助管理crates.io依赖项
		use({
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			config = function()
				require("config.crates")
			end,
		})

		------------------------------- 代码测试 ----------------------------
		---------------------------------------------------------------------

		--Debug组件
		use({
			"mfussenegger/nvim-dap",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			config = function()
				require("config.nvim-dap")
			end,
		})

		---------------------------------其他------------------------------
		-------------------------------------------------------------------

		-- 侧边栏
		use({
			"sidebar-nvim/sidebar.nvim",
			cmd = "SidebarNvimToggle",
			config = function()
				require("config.sidebar")
			end,
		})

		-- tree文件树
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = function()
				require("config.nvim-tree")
			end,
		})

		-- 终端
		use({
			"akinsho/toggleterm.nvim",
			keys = "<c-\\>",
			config = function()
				require("config.toggleterm")
			end,
		})

		-- 翻译插件
		use({
			"uga-rosa/translate.nvim",
			keys = "<leader>tl",
			config = function()
				require("config.translate")
			end,
		})

		-- git组件
		use({
			"lewis6991/gitsigns.nvim",
			ft = { "lua", "rust", "javascript", "typescript", "html", "toml", "go" },
			tag = "release", -- To use the latest release
			config = function()
				require("config.gitsigns")
			end,
		})

		------------------------------------------------------------|
		-----------------| 插件书写在上面 |-------------------------|
		------------------------------------------------------------|
		use({ "wbthomason/packer.nvim" }) -- 自我管理
	end,

	config = {
		-- 通过ssh链接安装插件
		git = {
			default_url_format = "git@github.com:%s",
		},
		-- 插件加载分析
		profile = {
			enable = true,
			threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},
		-- compile_path = util.join_paths(vim.fn.stdpath("chace"), "plugin", "packer_compiled.lua"),
		luarocks = {
			python_cmd = "python3",
		},
		display = {
			-- open_fn = require('packer.util').float,
		},
	},
})
