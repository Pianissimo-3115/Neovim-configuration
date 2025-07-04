return { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup({
            indent = { char = "│" },  -- Indentation guide character
            scope = { enabled = true } -- Highlight active indent scope
        })
    end
}
