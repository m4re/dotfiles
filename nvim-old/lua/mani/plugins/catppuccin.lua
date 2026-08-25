return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "frappe",
            styles = {
                functions = { "italic" },
                keywords = { "bold" },
            },
            transparent_background = true,
        })
    end
}
