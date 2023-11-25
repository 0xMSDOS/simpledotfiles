return{
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        --{
        --'nvim-telescope/telescope-fzf-native.nvim',
        --build = 'make',
       -- config = function ()
         --   require('telescope').load_extension('fzf')
           -- end,
        --},
    },
    branch = "0.1.x",
    keys = {
        {
            '<leader>ff', function ()
            return require('telescope.builtin').find_files()
            end,
            desc = 'Files',
        },

        {
            '<leader>fw', function ()
            return require('telescope.builtin').live_grep()
            end,
            desc = 'Words',
        },

        {
            '<leader>fb', function ()
            return require('telescope.builtin').buffers()
            end,
            desc = 'Buffers',
        },

        {
            '<leader>fh', function ()
            return require('telescope.builtin').help_tags()
            end,
            desc = 'Help',
        },

        {
            '<leader>fo', function ()
            return require('telescope.builtin').oldfiles()
            end,
            desc = 'Old Files',
        },

        {
            '<leader>fc', function ()
            return require('telescope.builtin').colorscheme()
            end,
            desc = 'Color Scheme',
        },
    },
    opts = function ()

    local telescopeConfig = require('telescope.config')
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    table.insert(vimgrep_arguments, '--hidden')
    table.insert(vimgrep_arguments, '--glob')
    table.insert(vimgrep_arguments, '!**/.git/*')

    return {
        defaults = {
            vimgrep_arguments = vimgrep_arguments,
            theme = 'tokyonight',
            layout_strategy = 'horizontal',
            color_devicons = true,
            path_display = { 'smart' },
            prompt_prefix = ' ',
            layout_config = { prompt_position = 'bottom' },
            extensions = {
                media_file = {
                    filetypes = { "png", "webp", "jpg", "mp4", "mkv", "pdf", "jpeg", "webm" },
                    find_cmd = 'fd'
                }
            },
            pickers = { find_files = { find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' } } },

        },
        }
    end,
}
