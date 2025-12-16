return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})

    vim.keymap.set("n", "<leader>r", function()
      require("grug-far").open()
    end, { desc = "Open Grug Far search and replace" })
  end,
}
