require('nvim-treesitter.configs').setup {
    ensure_installed = { 
        "typescript", 
        "javascript", 
        "vim", 
        "rust", 
        "go", 
        "c",
        "lua",
        "dockerfile",
        "json",
        "markdown",
        "php",
        "yaml",
        "html",
        "css",
        "scss"
    },
    highlight = { enable = true },
}
