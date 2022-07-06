-- https://github.com/ggandor/leap.nvim

require("leap").setup({
	case_insensitive = true,
	-- Leaving the appropriate list empty effectively disables "smart" mode,
	-- and forces auto-jump to be on or off.
	-- safe_labels = nil,
	-- labels = nil,
	-- These keys are captured directly by the plugin at runtime.
	special_keys = {
		repeat_search = "<enter>",
		next_match = "<enter>",
		prev_match = "<tab>",
		next_group = "<space>",
		prev_group = "<tab>",
		eol = "<space>",
	},
})

-- 向前跳跃
vim.keymap.set("n", "f", "<Plug>(leap-forward)")
-- 向后跳跃
vim.keymap.set("n", "t", "<Plug>(leap-backward)")
