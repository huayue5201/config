-- https://github.com/kosayoda/nvim-lightbulb

require("nvim-lightbulb").setup({
	virtual_text = {
		enabled = true,
		-- Text to show at virtual text
		text = " 💡",
		-- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
		hl_mode = "blend",
	},
	autocmd = {
		enabled = true,
		-- see :help autocmd-pattern
		pattern = { "*" },
		-- see :help autocmd-events
		events = { "CursorHold", "CursorHoldI" },
	},
})
