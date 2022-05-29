require('nvim-treesitter.configs').setup {
    ensure_installed = { 
        "typescript", 
        "javascript", 
        "vim", 
        "rust", 
        "go", 
        "c",
        "lua",
        "java",
        "c_sharp",
        "dockerfile",
        "json",
        "latex",
        "markdown",
        "php",
        "yaml"
    },
    highlight = { enable = true },
}
