return  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = [[<leader>ot]],
    opts = {
      open_mapping = [[<leader>ot]],
      size = 20,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shell = vim.o.shell,
      shade_terminals = true,
      shading_factor = 2,
      persist_size = true,
      start_in_insert = true,
      direction = 'float',
      close_on_exit = true,
      float_opts = { border = 'curved' },
    },
  }
