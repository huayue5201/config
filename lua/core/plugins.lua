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

		-- https://github.com/nathom/filetype.nvim
		-- 该插件加快启动速度
		use({
			"nathom/filetype.nvim",
			config = function()
				require("config.filetype")
			end,
		})

		-- https://github.com/antoinemadec/FixCursorHold.nvim
		-- 解决一个nvovim的设计bug
		use({ "antoinemadec/FixCursorHold.nvim" })

		-- 多个插件依赖该模块(官方)
		use({ "nvim-lua/plenary.nvim" })

		--  Neovim中来自vim的Popup API的实现(官方)
		use({ "nvim-lua/popup.nvim" })

		-- 图标支持,很多插件依赖该插件
		use({ "kyazdani42/nvim-web-devicons" })

		-- WARN:需要安装sqlite
		-- https://github.com/tami5/sqlite.lua
		-- 用于存储、检索、缓存和持久化SQLite数据库
		use({ "tami5/sqlite.lua" })

		---------------------------UI 视觉-----------------------------
		---------------------------------------------------------------

		-- https://github.com/ray-x/aurora
		-- 主题
		use({
			"ray-x/aurora",
			config = function()
				vim.cmd([[
                let g:aurora_italic = 1" italic
                let g:aurora_bold = 1" bold
                colorscheme aurora
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

		-- 美化quickfix lsp诊断内容
		use({
			"https://gitlab.com/yorickpeterse/nvim-pqf.git",
			config = function()
				require("config.bqf")
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

		-- 基于treesitter的文本操作模块(官方)
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })

		-- Treesitter驱动的拼写检查器
		use({
			"lewis6991/spellsitter.nvim",
			config = function()
				require("spellsitter").setup({
					-- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
					enable = true,
				})
			end,
		})

		-- 彩虹括号(依赖treesitter)
		use({ "p00f/nvim-ts-rainbow" })

		-- 突出显示匹配符号并提供额外的操作符
		-- https://github.com/andymass/vim-matchup/
		use({
			"andymass/vim-matchup",
			config = function()
				vim.cmd([[
                let g:matchup_matchparen_offscreen = {'method': 'popup'}
                let g:matchup_surround_enabled = 1 " 启用匹配符号删改操作
                let g:matchup_delim_noskips = 1   " recognize symbols within comments
                let g:matchup_delim_noskips = 2   " don't recognize anything in comments
                let g:matchup_matchparen_deferred = 1 "延时突出显示，提高光标移动性能
                ]])
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

		-------------------------------文本操作--------------------------------
		---------------------------------------------------------------------

		-- https://github.com/mg979/vim-visual-multi
		-- 多光标
		use({ "mg979/vim-visual-multi" })

		-- https://github.com/chentoast/marks.nvim
		--marks
		use({
			"chentoast/marks.nvim",
			config = function()
				require("config.marks")
			end,
		})

		-- 显示缩进线
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("config.blankline")
			end,
		})

		-- 自动缩进
		use({
			"Darazaki/indent-o-matic",
			cofnig = function()
				require("config.indent-o-matic")
			end,
		})

		-- 代码注释
		use({
			"numToStr/Comment.nvim",
			requires = {
				-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
				-- 根据上下文提供不同的注释方案
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				require("config.Comment")
			end,
		})

		-- 增强复制粘贴功能
		use({
			"gbprod/yanky.nvim",
			config = function()
				require("config.yanky")
			end,
		})

		-- https://github.com/kylechui/nvim-surround
		-- 环绕符号 快捷键：
		use({
			"kylechui/nvim-surround",
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

		----------------------------------搜索-----------------------------
		-------------------------------------------------------------------

		-- 模糊搜索
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				-- fzf算法组件(由c实现)
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				-- AI算法
				{ "nvim-telescope/telescope-frecency.nvim" },
			},
			config = function()
				require("config.telescope")
			end,
		})

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

		------------------------------LSP相关-------------------------------
		--------------------------------------------------------------------

		-- LSP基础组件（官方）
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("config.nvim-lspconfig")
			end,
		})

		-- https://github.com/simrat39/rust-tools.nvim
		-- rust LSP开发组件
		use({ "simrat39/rust-tools.nvim" })

		-- 代码操作标志💡
		use({
			"kosayoda/nvim-lightbulb",
			config = function()
				require("config.nvim-lightbulb")
			end,
		})

		-- 代码操作UI
		use({
			"weilbith/nvim-code-action-menu",
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

		-- 更好的折叠机制
		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
			config = function()
				require("config.nvim-ufo")
			end,
		})

		-----------------------------补全-----------------------------
		--------------------------------------------------------------

		-- coq补全引擎
		use({
			"ms-jpq/coq_nvim",
			run = "python3 -m coq deps",
			requires = {
				{ "ms-jpq/coq.artifacts" },
				{ "ms-jpq/coq.thirdparty" },
			},
		})

		-- https://github.com/ray-x/lsp_signature.nvim
		-- 签名帮助
		use({ "ray-x/lsp_signature.nvim" })

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
		use({ "windwp/nvim-ts-autotag", ft = "html" })

		-- https://github.com/Saecki/crates.nvim
		-- 帮助管理crates.io依赖项
		use({
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			config = function()
				require("config.crates")
			end,
		})

		-------------------------------移动----------------------------------
		---------------------------------------------------------------------

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
		------------------------------- 代码测试 ----------------------------
		---------------------------------------------------------------------

		--Debug组件
		use({
			"mfussenegger/nvim-dap",
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

		-- 代码大纲
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("config.aerial")
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
			tag = "release", -- To use the latest release
			config = function()
				require("config.gitsigns")
			end,
		})

		-- 映射/命令辅助器,降低记忆负担
		use({
			"folke/which-key.nvim",
			config = function()
				require("config.which-key")
			end,
		})

		-- neorg文本格式(官方)
		use({
			"nvim-neorg/neorg",
			tag = "*",
			ft = "norg", -- WARN:设置延迟加载会导致打开.norg文件变慢!
			after = "nvim-treesitter", -- -- You may want to specify Telescope here as well
			config = function()
				require("config.neorg")
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
