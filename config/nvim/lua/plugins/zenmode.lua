return {
    'folke/zen-mode.nvim',
    dependencies = {
      {
        'folke/twilight.nvim',
        keys = { { '<leader>t', '<cmd>Twilight<CR>', desc = 'Toggle twilight.nvim' } },
        config = true,
      },
    },
    opts = { plugins = { kitty = { enabled = true, font = '+4' } } },
    keys = {
      {
        '<leader>z',
        function()
          return require('zen-mode').toggle()
        end,
        desc = 'Toggle zen-mode.nvim',
      },
    },
}
