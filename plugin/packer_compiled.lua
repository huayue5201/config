-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/huayue520/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/huayue520/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/huayue520/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/huayue520/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/huayue520/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/huayue520/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.Comment\frequire\0" },
    keys = { { "", "gc" }, { "", "gb" }, { "", "gcc" }, { "", "gbc" }, { "", "gc0" }, { "", "gco" }, { "", "gcA" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "git@github.com:numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "git@github.com:antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "git@github.com:L3MON4D3/LuaSnip"
  },
  ["LuaSnip-snippets.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/LuaSnip-snippets.nvim",
    url = "git@github.com:molleweide/LuaSnip-snippets.nvim"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.aerial\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "git@github.com:stevearc/aerial.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "git@github.com:famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.bufferline\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "git@github.com:akinsho/bufferline.nvim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.cinnamon\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "git@github.com:declancm/cinnamon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "git@github.com:saadparwaiz1/cmp_luasnip"
  },
  ["crates.nvim"] = {
    after_files = { "/home/huayue520/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.crates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "git@github.com:saecki/crates.nvim"
  },
  ["dracula.nvim"] = {
    config = { "\27LJ\2\n¦\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0-\t\t\t\tcolorscheme dracula\n                \bcmd\27dracula_transparent_bg\f#4B0082\29dracula_lualine_bg_color\6g\bvim\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "git@github.com:Mofiqul/dracula.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.fidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "git@github.com:j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.filetype\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "git@github.com:nathom/filetype.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/fzf",
    url = "git@github.com:junegunn/fzf"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/fzy-lua-native",
    url = "git@github.com:romgrk/fzy-lua-native"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.harpoon\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "git@github.com:ThePrimeagen/harpoon"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "git@github.com:lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "git@github.com:lukas-reineke/indent-blankline.nvim"
  },
  ["indent-o-matic"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/indent-o-matic",
    url = "git@github.com:Darazaki/indent-o-matic"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.leap\frequire\0" },
    keys = { { "", "f" }, { "", "t" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/leap.nvim",
    url = "git@github.com:ggandor/leap.nvim"
  },
  ["lspkind.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/lspkind.nvim",
    url = "git@github.com:onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.lualine\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "git@github.com:nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.null-ls\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "git@github.com:jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "git@github.com:windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim-bqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "git@github.com:kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    config = { "\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\vsingle#code_action_menu_window_border\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "git@github.com:weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.nvim-colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "git@github.com:norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim-dap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "git@github.com:mfussenegger/nvim-dap"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.hlslens\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "git@github.com:kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.nvim-lightbulb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "git@github.com:kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    after = { "aerial.nvim", "lspkind.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "git@github.com:SmiteshP/nvim-navic"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.nvim-neoclip\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "git@github.com:acksld/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.nvim-notify\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "git@github.com:rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.nvim-surround\frequire\0" },
    keys = { { "", "ys" }, { "", "yss" }, { "", "cs" }, { "", "ds" }, { "", "V" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "git@github.com:kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "git@github.com:kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "git@github.com:nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-trevJ.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.nvim-trevJ\frequire\0" },
    keys = { { "", "<leader>j" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-trevJ.lua",
    url = "git@github.com:AckslD/nvim-trevJ.lua"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "git@github.com:windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "git@github.com:JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim-ufo\frequire\0" },
    keys = { { "", "zR" }, { "", "zM" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/nvim-ufo",
    url = "git@github.com:kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@github.com:kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "git@github.com:nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.project\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "git@github.com:ahmedkhalf/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "git@github.com:kevinhwang91/promise-async"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "git@github.com:simrat39/rust-tools.nvim"
  },
  ["sidebar.nvim"] = {
    commands = { "SidebarNvimToggle" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.sidebar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/sidebar.nvim",
    url = "git@github.com:sidebar-nvim/sidebar.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "git@github.com:tami5/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "git@github.com:nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.todo-comments\frequire\0" },
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "git@github.com:folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0" },
    keys = { { "", "<c-\\>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "git@github.com:akinsho/toggleterm.nvim"
  },
  ["translate.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.translate\frequire\0" },
    keys = { { "", "<leader>tl" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/translate.nvim",
    url = "git@github.com:uga-rosa/translate.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "/home/huayue520/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\nò\1\0\0\3\0\a\0\0216\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\2\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0F\t\t\t\tlet g:matchup_matchparen_offscreen = {'method': 'popup'}\n\t\t\t\t\bcmd matchup_matchparen_deferred\26matchup_delim_noskips\29matchup_surround_enabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "git@github.com:andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "git@github.com:tpope/vim-repeat"
  },
  ["vim-visual-multi"] = {
    keys = { { "", "<c-n>" }, { "", "<c-Down>" }, { "", "<c-Up>" }, { "", "<s-Up>" }, { "", "<s-Down>" }, { "", "<s-Left>" }, { "", "<s-Right>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "git@github.com:mg979/vim-visual-multi"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.wilder\frequire\0" },
    keys = { { "", "/" }, { "", "?" }, { "", ":" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/huayue520/.local/share/nvim/site/pack/packer/opt/wilder.nvim",
    url = "git@github.com:gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.hlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.harpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.nvim-lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.nvim-notify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.cinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.filetype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.nvim-neoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: dracula.nvim
time([[Config for dracula.nvim]], true)
try_loadstring("\27LJ\2\n¦\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0-\t\t\t\tcolorscheme dracula\n                \bcmd\27dracula_transparent_bg\f#4B0082\29dracula_lualine_bg_color\6g\bvim\0", "config", "dracula.nvim")
time([[Config for dracula.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lspkind.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SidebarNvimToggle lua require("packer.load")({'sidebar.nvim'}, { cmd = "SidebarNvimToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <c-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>c-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcA <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcA", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ds <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> : <cmd>lua require("packer.load")({'wilder.nvim'}, { keys = ":", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-Down> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>c-Down>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc0 <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc0", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gbc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gbc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <s-Left> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>s-Left>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <s-Right> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>s-Right>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <s-Down> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>s-Down>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <s-Up> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>s-Up>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> zM <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "zM", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>j <cmd>lua require("packer.load")({'nvim-trevJ.lua'}, { keys = "<lt>leader>j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> zR <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "zR", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gco <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gco", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> cs <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> yss <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ys <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-\> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>c-\\>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>tl <cmd>lua require("packer.load")({'translate.nvim'}, { keys = "<lt>leader>tl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> V <cmd>lua require("packer.load")({'nvim-surround'}, { keys = "V", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-Up> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>c-Up>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> / <cmd>lua require("packer.load")({'wilder.nvim'}, { keys = "/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ? <cmd>lua require("packer.load")({'wilder.nvim'}, { keys = "?", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-dap', 'nvim-code-action-menu', 'null-ls.nvim', 'indent-blankline.nvim', 'gitsigns.nvim', 'fidget.nvim', 'nvim-lightbulb', 'nvim-ufo', 'vim-matchup', 'aerial.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'indent-o-matic', 'vim-matchup', 'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
