return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
        "lua",
        "luadoc",
        "c",
        "java",
        "yuck",
        "cpp",
        "awk",
        "arduino",
        "cpp",
        "scss",
        "css",
        "fennel",
        "javascript",
        "json",
        "kotlin",
        "latex",
        "markdown",
        "python",
        "perl",
        "ruby",
        "rust",
        "sql",
        "typescript",
        "vim",
        "go",
        "c_sharp",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
            },
        },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"},
        },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        }
      }
    },
    -- For rainbow
    rainbow = { enable = true},
    -- For autotag
    autotag = { enable = true},
  },
}
