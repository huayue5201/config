-- https://github.com/williamboman/mason.nvim

require("mason").setup({
	ui = {
		-- UI边框
		border = "none",
	},
})

-- https://github.com/williamboman/mason-lspconfig.nvim
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright", "taplo" },
	-- 自动安装列表中的服务器
	 automatic_installation = true,
})
