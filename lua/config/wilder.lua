-- https://github.com/gelguy/wilder.nvim

local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

-- Disable Python remote plugin
wilder.set_option("use_python_remote_plugin", 0)

wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = 1,
			fuzzy_filter = wilder.lua_fzy_filter(),
		}),
		wilder.vim_search_pipeline()
	),
})

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
			-- 突出匹配字符
			highlighter = wilder.lua_fzy_highlighter(),
			-- 图标支持,依赖kyazdani42/nvim-web-devicons插件
			left = {
				" ",
				wilder.popupmenu_devicons(),
			},
			right = {
				" ",
				wilder.popupmenu_scrollbar(),
			},
			-- (neovim)菜单透明度
			pumblend = 20,
			-- 菜单外框
			highlights = {
				border = "Normal", -- highlight to use for the border
			},
			-- 'single', 'double', 'rounded' or 'solid'
			-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
			border = "rounded",
		})),
		["/"] = wilder.wildmenu_renderer({
			highlighter = wilder.lua_fzy_highlighter(),
            -- 分隔符
			separator = " · ",
			left = { " ", wilder.wildmenu_spinner(), " " },
			right = { " ", wilder.wildmenu_index() },
		}),
	})
)
