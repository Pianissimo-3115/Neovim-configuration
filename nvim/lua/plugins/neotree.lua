return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,  -- Show hidden files
                    hide_dotfiles = false,  -- Explicitly show dotfiles
                },
                window = {
                    width = 30,  -- Customize the width here
                },
            },
        })

        vim.keymap.set('n', '<C-d>', ':Neotree filesystem reveal left<CR>', {})
    end
}
