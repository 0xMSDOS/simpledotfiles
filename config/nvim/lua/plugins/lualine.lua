return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function ()
        local colors = {
        bg = '#1A182C',
        white = '#D4D7DC',
        yellow = '#ecd28b',
        cyan = '#67AFC1',
        purple = '#c58cec',
        orange = '#E89982',
        red = '#DF5B61',
        blue = '#6791C9',
        dark_purple = '#BC83E3',
        green = '#98be65',
        grey = '#343637',
        black = '#141617',
    }

    local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width_first = function()
				return vim.fn.winwidth(0) > 80
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 70
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

        -- auto change color according to neovim mode 
       local mode_color = {
            n = colors.green,
            i = colors.yellow,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.white,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.yellow,
            Rv = colors.green,
            cv = colors.purple,
            ce = colors.purple,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        -- Config
        local config = {
            options = {
                -- Remove default sections and component separators
                component_separators = "",
                section_separators = "",
                theme = {
                    normal = { c = { fg = colors.black, bg = colors.bg } },
                    inactive = { c = { fg = colors.black, bg = colors.bg } },
                },
            },
            sections = {
				-- clear defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- clear for later use
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- clear defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- clear for later use
				lualine_c = {},
				lualine_x = {},
			},
        }
    -- insert active component in lualine_c at left section
		local function active_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- insert inactive component in lualine_c at left section
		local function inactive_left(component)
			table.insert(config.inactive_sections.lualine_c, component)
		end

		-- insert active component in lualine_x at right section
		local function active_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- insert inactive component in lualine_x at right section
		local function inactive_right(component)
			table.insert(config.inactive_sections.lualine_x, component)
		end

	-- dump object contents
	local function dump(o)
		if type(o) == 'table' then
			local s = ''
			for k, v in pairs(o) do
				if type(k) ~= 'number' then k = '"' .. k .. '"' end
				s = s .. dump(v) .. ','
			end
			return s
		else
			return tostring(o)
		end
	end

        -- Active-left
        active_left({
            function ()
                return " "
            end,
            color = { bg = colors.green, fg = colors.black },
            padding = { left = 1, right = 1 }
        })

         active_left({
            "mode",
            icons_enabled = true,
            color = { bg = colors.grey, fg = colors.yellow },
            padding = { left = 1, right = 1 },
            separator = { right = "⬜", left = "█" },
        })

        active_left({
			function()
				local icon
				local ok, devicons = pcall(require, 'nvim-web-devicons')
				if ok then
					icon = devicons.get_icon(vim.fn.expand('%:t'))
					if icon == nil then
                        -- To get the language icon
						icon = devicons.get_icon_by_filetype(vim.bo.filetype)
					end
				else
					if vim.fn.exists('*WebDevIconsGetFileTypeSymbol') > 0 then
						icon = vim.fn.WebDevIconsGetFileTypeSymbol()
					end
				end
				if icon == nil then
					icon = '󰍜 '
				end
				return icon:gsub("%s+", "")
			end,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = colors.black }
			end,
			padding = { left = 1, right = 1 },
			separator = { right = "▓" },
		})

        active_left({
			"filename",
            icon = "",
			cond = conditions.buffer_not_empty,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = colors.black }
			end,
			padding = { left = 1, right = 1 },
			separator = { right = " | " },
			symbols = {
				modified = "󰙏 ",
				readonly = " ",
				unnamed = " ",
				newfile = " ",
			},
		})

        active_left({
			"branch",
			icon = "",
			color = { bg = colors.blue, fg = colors.black },
			padding = { left = 0, right = 1 },
			separator = { right = "", left = "" },
		})

        -- inactive left section
		inactive_left({
			function()
				return ''
			end,
			cond = conditions.buffer_not_empty,
			color = { bg = colors.black, fg = colors.grey },
			padding = { left = 1, right = 1 },
		})

        inactive_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { bg = colors.black, fg = colors.grey },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
			symbols = {
				modified = "",
				readonly = "",
				unnamed = "",
				newfile = "",
			},
		})

	-- active right section
	active_right({
		function()
			local clients = vim.lsp.get_active_clients()
			local clients_list = {}
			for _, client in pairs(clients) do
				if (not clients_list[client.name]) then
					table.insert(clients_list, client.name)
				end
			end
			local lsp_lbl = dump(clients_list):gsub("(.*),", "%1")
			return lsp_lbl:gsub(",", ", ")
		end,
		icon = " ",
		color = { bg = colors.green, fg = colors.black },
		padding = { left = 1, right = 1 },
		cond = conditions.hide_in_width_first,
		separator = { right = "▓▒░", left = "░▒▓" },
		})

        active_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			colored = true,
			color = { bg = colors.cyan, fg = colors.black },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})

        active_right({
			"searchcount",
			color = { bg = colors.orange, fg = colors.black },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})

        active_right({
			"location",
            icon = " ",
			color = { bg = colors.red, fg = colors.white },
			padding = { left = 1, right = 0 },
			separator = { left = "░▒▓" },
        })

        active_right({
			function()
				local cur = vim.fn.line(".")
				local total = vim.fn.line("$")
				return string.format("%2d%%%%", math.floor(cur / total * 100))
			end,
			color = { bg = colors.red, fg = colors.white },
			padding = { left = 1, right = 1 },
			cond = conditions.hide_in_width,
			separator = { right = "▓▒░" },
		})

        active_right({
			"fileformat",
            icons_enabled = true,
            symbols = { unix = '󰌽 ' },
			fmt = string.lower,
			cond = conditions.hide_in_width,
			color = { bg = colors.blue, fg = colors.black },
			separator = { right = "▓▒░" },
			padding = { left = 0, right = 1 },
		})

        active_right({
			"o:encoding",
			fmt = string.upper,
			cond = conditions.hide_in_width,
			padding = { left = 1, right = 1 },
			color = { bg = colors.blue, fg = colors.black },
		})

        -- inactive right section
		inactive_right({
			"location",
			color = { bg = colors.black, fg = colors.grey },
			padding = { left = 1, right = 0 },
			separator = { left = "░▒▓" },
		})
		inactive_right({
			"progress",
			color = { bg = colors.black, fg = colors.grey },
			cond = conditions.hide_in_width,
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
		})
		inactive_right({
			"fileformat",
			fmt = string.lower,
			icons_enabled = false,
			cond = conditions.hide_in_width,
			color = { bg = colors.black, fg = colors.grey },
			separator = { right = "▓▒░" },
			padding = { left = 0, right = 1 },
		})


    return config
    end,
}
