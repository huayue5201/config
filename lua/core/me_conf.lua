-- 禁用自带插件，节省启动时间
vim.g.loaded_matchparen = 1 -- 高亮括号
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

-- http://neovim.io/news/
-- 提升neovim器动速度,该功能在8.0会成为默认配置
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- 光标配置
vim.cmd([[ 
" 光标闪烁"
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
au VimLeave,VimSuspend * set guicursor=a:block-blinkon0
]])

-- 垂直打开帮助页面
vim.cmd([[ 
autocmd BufWinEnter * if &filetype == 'help' | wincmd L | endif
]])

-- 自动定位到最后编辑的位置
vim.cmd([[
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
]])

-- -- yy高亮复制范围
-- vim.cmd([[
--   augroup YankHighlight
--   autocmd!
--   autocmd TextYankPost * silent! lua vim.highlight.on_yank()
--   augroup end
--  ]])

-- Packer自动运行PackerCompile命令
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
