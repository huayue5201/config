-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- 符号补全 windwp/nvim-autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp = require("cmp")

-- 图标支持
local lspkind = require("lspkind")

-- 符号补全 windwp/nvim-autopairs
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({

	-- 补全源列表
	sources = {
		{ name = "vsnip" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ neme = "path" },
		-- saecki/crates.nvim提供方法
		{ name = "crates" },
	},
	-- ... Your other configuration ...

	mapping = {

		-- ... Your other mappings ...

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- ... Your other mappings ...
	},

	-- 菜单方向
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},

	-- 菜单外观设置
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			},
		}),
	},
	-- ... Your other configuration ...
})
