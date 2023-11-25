return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim" },
    branch = "v3.x",
    keys= { { '<C-t>', '<cmd>Neotree toggle<CR>', desc = 'Open neo-tree.nvim' } },
    opts = {

    vim.fn.sign_define("DiagnosticSignError",
            {text = " ", texthl = "DiagnosticSignError"}),
    vim.fn.sign_define("DiagnosticSignWarn",
            {text = " ", texthl = "DiagnosticSignWarn"}),
    vim.fn.sign_define("DiagnosticSignInfo",
            {text = " ", texthl = "DiagnosticSignInfo"}),
    vim.fn.sign_define("DiagnosticSignHint",
            {text = "󰌵", texthl = "DiagnosticSignHint"}),

        event_handlers = {
        {
        event = 'file_opened',
        handler = function()
                require('neo-tree.command').execute({ action = 'close' })
                end,
            },
        },
        filesystem = {
            filtered_items = { hide_dotfiles = false, hide_by_name = { '.git' } },
            follow_current_file = { enabled = true},
            use_libuv_file_watcher = true,
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            highlight = "NeoTreeFileIcon"
            },
        modified = {
            symbol = "●",
            highlight = "NeoTreeModified",
          },
        indent = {
			indent_size = 2,
			padding = 1,
			with_markers = false,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndent",
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeIndent",
		},
        git_status = {
			symbols = {
				added = "",
				modified = "",
				deleted = "",
				renamed = "",
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
    },
},

}
