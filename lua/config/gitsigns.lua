-- https://github.com/lewis6991/gitsigns.nvim

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
        -- 提交修改
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        -- 撤销修改
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- 提交buffer内所有修改
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
        -- 撤销buffer内所有修改
    map('n', '<leader>hR', gs.reset_buffer)
        -- 浮窗预览修改
    map('n', '<leader>hp', gs.preview_hunk)
        -- 浮窗对比差异
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        -- 开/关虚拟文本提示
    map('n', '<leader>tb', gs.toggle_current_line_blame)
        -- 左右窗口差异对比
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
