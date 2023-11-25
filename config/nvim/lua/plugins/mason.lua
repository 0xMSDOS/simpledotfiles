return {
    "williamboman/mason.nvim",
    config = {
        ui = {
            icons = {
                package_installed = "󰗠",
                package_pending = "",
                package_uninstalled = "",
            },
            keymaps = {
                toggle_package_expand = "<CR>",
                install_package = "i",
                update_package = "u",
                check_package_version = "c",
                update_all_packages = "U",
                check_outdated_packages = "C",
                uninstall_package = "X",
                cancel_installation = "<C-c>",
                toogle_help = "g?",
            },
        },
    },
}

