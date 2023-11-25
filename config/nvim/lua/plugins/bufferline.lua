return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '*',
    event = 'UIEnter',
    keys = {
      { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Go to next buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Go to previous buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<CR>', desc = 'Go to next buffer' },
      { ']b', '<cmd>BufferLineCycleNext<CR>', desc = 'Go to previous buffer' },
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
      {
        '<leader>b1',
        function()
          return require('bufferline').go_to(1, true)
        end,
        desc = 'Jump to first buffer',
      },
      {
        '<leader>b2',
        function()
          return require('bufferline').go_to(2, true)
        end,
        desc = 'Jump to second buffer',
      },
      {
        '<leader>b3',
        function()
          return require('bufferline').go_to(3, true)
        end,
        desc = 'Jump to third buffer',
      },
      {
        '<leader>b4',
        function()
          return require('bufferline').go_to(4, true)
        end,
        desc = 'Jump to fourth buffer',
      },
      {
        '<leader>b5',
        function()
          return require('bufferline').go_to(5, true)
        end,
        desc = 'Jump to fifth buffer',
      },
      {
        '<leader>b6',
        function()
          return require('bufferline').go_to(6, true)
        end,
        desc = 'Jump to sixth buffer',
      },
      {
        '<leader>b7',
        function()
          return require('bufferline').go_to(7, true)
        end,
        desc = 'Jump to seventh buffer',
      },
      {
        '<leader>b8',
        function()
          return require('bufferline').go_to(8, true)
        end,
        desc = 'Jump to eighth buffer',
      },
      {
        '<leader>b9',
        function()
          return require('bufferline').go_to(9, true)
        end,
        desc = 'Jump to ninth buffer',
      },
      {
        '<leader>b$',
        function()
          return require('bufferline').go_to(-1, true)
        end,
        desc = 'Jump to last buffer',
      },
    },
    opts = {
      options = {
        numbers = function(opts)
          return string.format('%s', opts.ordinal)
        end,
        mode = 'buffers',
        buffer_close_icon = ' ',
        modified_icon = ' ',
        close_icon = '',
        color_icons = true,
        hover = {
                {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                }
            },
        diagnostics = 'nvim_lsp',
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
            s = s .. n .. sym
          end
          return s
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
            separator = true
          },
        },

        },
    },
  }
