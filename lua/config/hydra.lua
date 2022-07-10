local Hydra = require('hydra')

Hydra({
   name = '窗口切换',
   mode = 'n',
   body = 'c-w',
   heads = {
      { 'h', '5zh' },
      { 'j', '5zl', { desc = '←/→' } },
      { 'k', 'zH' },
      { 'l', 'zL', { desc = 'half screen ←/→' } },
   }
})
