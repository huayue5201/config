-- https://github.com/declancm/cinnamon.nvim
-- 平滑滚动

require("cinnamon").setup({
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = false, -- Create extra keymaps.
	extended_keymaps = true, -- Create extended keymaps.
	centered = true, -- Keep cursor centered in window when using window scrolling.
	default_delay = 15, -- The default delay (in ms) between lines when scrolling.
	scroll_limit = 100, -- Max number of lines moved before scrolling is skipped.
})
