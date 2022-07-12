-- https://github.com/kevinhwang91/nvim-ufo

vim.o.foldcolumn = "1"
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- option 4: disable all providers for all buffers
-- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
require("ufo").setup({
	provider_selector = function(bufnr, filetype)
		return { "treesitter", "indent" }
	end,
})
