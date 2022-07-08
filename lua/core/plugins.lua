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

local is_mac = has("maxunix")
local is_linx = not is_wsl and not is_mac

-- require('packer.luarocks').cfg({ luarocks =

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

		-- 主题
		use({
			"folke/tokyonight.nvim",
			config = function()
				vim.cmd([[colorscheme tokyonight]])
				vim.g.tokyonight_lualine_bold = true
			end,
		})

		-- 状态栏
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("config.lualine")
			end,
		})

		-- https://github.com/romgrk/barbar.nvim
		-- TAB栏
		use({ "romgrk/barbar.nvim" })

		-- https://github.com/stevearc/dressing.nvim
		-- input or select UI组件
		use({ "stevearc/dressing.nvim" })

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

		-- 基于treesitter的code重构模块(官方)
		use({ "nvim-treesitter/nvim-treesitter-refactor" })

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

		-- 顶部悬停显示光标所在行上下文
		use({
			"nvim-treesitter/nvim-treesitter-context",
			ft = { "go", "rust", "lua" },
			config = function()
				require("config.treesitter-context")
			end,
		})

		-- tab键跳出括号,引号,上下文范围
		use({
			"abecodes/tabout.nvim",
			config = function()
				require("config.tabout")
			end,
		})

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
				require("marks").setup()
			end,
		})

		-- 显示缩进线
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("config.blankline")
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

		-- https://github.com/machakann/vim-sandwich
		-- 环绕符号 快捷键：sa添加 sd删除 sr替换
		use({ "machakann/vim-sandwich" })

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
				-- dap组件
				-- "nvim-telescope/telescope-dap.nvim"
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
			-- https://github.com/antoinemadec/FixCursorHold.nvim
			requires = "antoinemadec/FixCursorHold.nvim",
			config = function()
				require("config.nvim-lightbulb")
			end,
		})

		-- 代码操作UI组件
		use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

		-- 集成非LSP模块之外的诊断,格式化,代码操作功能
		use({
			"jose-elias-alvarez/null-ls.nvim",
			ft = { "go", "rust", "lua", "html" },
			config = function()
				require("config.null-ls")
			end,
		})

		-- LSP 加载进度UI
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("config.fidget")
			end,
		})

		-- https://github.com/SmiteshP/nvim-navic
		-- 一个简单的状态栏/winbar 组件，它使用 LSP 来显示您当前的代码上下文
		use({ "SmiteshP/nvim-navic" })

		-----------------------------补全-----------------------------
		--------------------------------------------------------------

		-- cmp补全
		use({
			"hrsh7th/nvim-cmp", -- 代码补全核心插件
			requires = {
				{ "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
				{ "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
				{ "hrsh7th/cmp-nvim-lsp" }, -- LSP源
				{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- 函数签名
				{ "hrsh7th/cmp-path" }, -- 路径补全
				{ "ray-x/cmp-treesitter" }, -- treesitter节点补全
				{ "hrsh7th/cmp-buffer" }, -- 缓冲区补全
				{ "f3fora/cmp-spell" }, -- 拼写建议
				{ "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
				{ "lukas-reineke/cmp-rg" }, -- rg补全提速
			},
			config = function()
				require("config.nvim-cmp")
			end,
		})

		-- 括号补全
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("config.nvim-autopairs")
			end,
		})

		-- 命令模式补全
		use({
			"gelguy/wilder.nvim",
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
			config = function()
				require("config.toggleterm")
			end,
		})

		-- 翻译插件
		use({
			"uga-rosa/translate.nvim",
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
		--
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
