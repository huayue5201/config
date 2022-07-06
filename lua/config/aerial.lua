-- https://github.com/stevearc/aerial.nvim

require("aerial").setup({
	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ta", "<cmd>AerialToggle!<CR>", {})
		-- Jump forwards/backwards with '{' and '}'
		vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
		-- Jump up the tree with '[[' or ']]'
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
	end,

	-- Priority list of preferred backends for aerial.
	-- This can be a filetype map (see :help aerial-filetype-map)
	backends = { "lsp", "treesitter", "markdown" },
	-- 宽度
	min_width = 30,
})
