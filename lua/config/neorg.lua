-- https://github.com/nvim-neorg/neorg

require("neorg").setup({
	load = {
		-- 基础模块,提供最基本的编辑支持
		["core.defaults"] = {},
		-- 工作区管理模块
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
			},
		},
	},
})

-- 更新解析器:Neorg sync-parsers
-- 改变工作区:Neorg workspace <具体目录>
-- 加载neorg工作环境:NeorgStart
