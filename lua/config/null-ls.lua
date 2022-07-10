-- https://github.com/jose-elias-alvarez/null-ls.nvim

-- WARN:安装各种外部源
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

local null_ls = require("null-ls")

null_ls.setup({
	-- add your sources / config options here
	sources = {

		-- https://github.com/rust-lang/rustfmt
		-- rust格式化
		null_ls.builtins.formatting.rustfmt,

		-- https://github.com/JohnnyMorganz/StyLua
		-- lua格式化软件,由stylua提供方法
		null_ls.builtins.formatting.stylua,

		-- https://github.com/mantoni/eslint_d.js
		-- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue"
		-- null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.formatting.eslint_d,
		-- null_ls.builtins.code_actions.eslint_d,

		-- https://github.com/htacg/tidy-html5
		-- html5格式化及诊断
		null_ls.builtins.formatting.tidy,
		null_ls.builtins.diagnostics.tidy.with({
			-- 诊断信息格式设置
			diagnostics_format = "[#{c}] #{m} (#{s})",
		}),

		-- git 代码操作
		-- null_ls.builtins.code_actions.gitsigns,

		-- https://github.com/koalaman/shellcheck
		-- shellcheck
		null_ls.builtins.code_actions.shellcheck,
	},
})
