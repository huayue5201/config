-- https://github.com/neovim/nvim-lspconfig
-- Lsp支持列表
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- hrsh7th/nvim-cmp集成
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP按键设置
---------------------------------------------------------------------
local opts = { noremap = true, silent = true }
-- 悬浮窗口查看该行问题
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
-- 跳转到下一个错误
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- 跳转到上一个错误
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- 查看当前buffer内诊断错误
vim.keymap.set("n", "<space>cl", vim.diagnostic.setloclist, opts)
-- 查看当前workspace内诊断问题
vim.keymap.set("n", "<leader>co", require("telescope.builtin").diagnostics)

local on_attach = function(client, bufnr)
	-- 突出显示光标下的符号
	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
        hi! LspReferenceRead cterm=bold ctermbg=red guibg=Magenta4
        hi! LspReferenceText cterm=bold ctermbg=red guibg=DarkSlateBlue
        hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightSlateGray
        ]])
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

	-- https://github.com/SmiteshP/nvim-navic
	require("nvim-navic").attach(client, bufnr)
	-- https://github.com/stevearc/aerial.nvim
	require("aerial").on_attach(client, bufnr)
	-- -- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- 跳转到声明
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- 跳转到定义
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
	-- 查看文档
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	-- 跳转到实现
	vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)
	-- 签名帮助
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	-- 添加工作区文件夹
	vim.keymap.set("n", "<space>ra", vim.lsp.buf.add_workspace_folder, bufopts)
	-- 删除工作区文件夹
	vim.keymap.set("n", "<space>rr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- 查看工作区文件夹
	vim.keymap.set("n", "<space>rl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	-- 跳转到类型定义
	vim.keymap.set("n", "<space>D", require("telescope.builtin").lsp_type_definitions, bufopts)
	-- 变量重命名
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	-- 代码操作
	vim.keymap.set("n", "<space>ca", "<cmd>CodeActionMenu<cr>", bufopts)
	-- 查看引用
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
	-- 格式化
	-- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

-- Lsp服务器加载
---------------------------------------------------------------------
-- https://github.com/simrat39/rust-tools.nvim
-- 通过rust-tools调用rust-analyer

-- 通过CodeLLDB增强调试功能 WARN:依赖外部软件CodeLLDB
-- https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

-- https://github.com/rust-lang/rust-analyzer
require("rust-tools").setup({
	-- rust-analyer options
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		standalone = true,
	}, -- rust-analyer options
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})

-- https://github.com/sumneko/lua-language-server
-- lua
require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- https://github.com/typescript-language-server/typescript-language-server
-- javascript
require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- https://taplo.tamasfe.dev/cli/installation/cargo.html
-- tmol lsp 
require("lspconfig").taplo.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
---------------------------------------------------------------------

-- 诊断图标
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lsp设置项
---------------------------------------------------------------------
vim.diagnostic.config({
	virtual_text = {
		-- 诊断信息显示lsp服务器
		source = "always", -- Or "if_many"
		-- 诊断信息前缀图标
		prefix = "■", -- Could be '●', '▎', 'x'
	},
	float = {
		-- 诊断信息显示lsp服务器(浮窗)
		source = "always", -- Or "if_many"
		-- 边框
		border = "rounded",
	},
	signs = true,
	underline = true,
	-- 插入模式禁用诊断
	update_in_insert = false,
	severity_sort = true,
})

-- 局部格式化代码
function format_range_operator()
	local old_func = vim.go.operatorfunc
	_G.op_func_formatting = function()
		local start = vim.api.nvim_buf_get_mark(0, "[")
		local finish = vim.api.nvim_buf_get_mark(0, "]")
		vim.lsp.buf.range_formatting({}, start, finish)
		vim.go.operatorfunc = old_func
		_G.op_func_formatting = nil
	end
	vim.go.operatorfunc = "v:lua.op_func_formatting"
	vim.api.nvim_feedkeys("g@", "n", false)
end

vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", { noremap = true })
