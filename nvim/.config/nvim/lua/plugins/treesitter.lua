return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = {
        "bash",
        "markdown",
        "markdown_inline",
        "ruby",
        "html",
        "css",
        "scss",
        "javascript",
        "java",
        "kotlin",
        "typescript",
        "json",
        "lua",
        "go",
        "gomod",
        "gowork",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  }
}
