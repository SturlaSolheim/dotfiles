return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        float = {
          transparent = true,
          solid = true
        }
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
