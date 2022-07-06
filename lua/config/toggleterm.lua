-- https://github.com/akinsho/toggleterm.nvim

-- 终端配置
require("toggleterm").setup({
	-- size can be a number or function which is passed the current terminal
	-- size = 20 | function(term)
	--   if term.direction == "horizontal" then
	--     return 15
	--   elseif term.direction == "vertical" then
	--     return vim.o.columns * 0.4
	--   end
	-- end,
	open_mapping = [[<c-\>]], -- 开关键
	-- on_open = fun(t: Terminal), -- function to run when the terminal opens
	-- on_close = fun(t: Terminal), -- function to run when the terminal closes
	-- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
	-- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
	-- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
	-- hide_numbers = true, -- hide the number column in toggleterm buffers
	-- shade_filetypes = {},
	-- highlights = {
	-- highlights which map to a highlight group name and a table of it's values
	-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
	--   Normal = {
	--     guibg = <VALUE-HERE>,
	--   },
	--   NormalFloat = {
	--     link = 'Normal'
	--   },
	--   FloatBorder = {
	--     guifg = <VALUE-HERE>,
	-- --     guibg = <VALUE-HERE>,
	-- --   },
	-- },
	shade_terminals = true,
	shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	-- 开启时默认进入插入状态
	start_in_insert = true,
	-- 按键映射在插入模式下也会生效
	insert_mappings = true,
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	-- 设置为false可以关闭窗口阴影
	shade_terminals = false,
	persist_size = true,
	-- 终端样式设置vertical/horizontal/tab/float
	direction = "horizontal",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- 悬浮边框设置single/double/shadow/corved
		-- border = "curved",
		-- width = <value>,
		-- height = <value>,
		winblend = 3,
	},
})
