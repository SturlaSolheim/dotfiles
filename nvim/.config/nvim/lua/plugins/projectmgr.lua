return {
  {
    "charludo/projectmgr.nvim",
    lazy = false,
    config = function()
      -- Plugin setup/configuration goes here if needed
      require('projectmgr').setup({
        -- your configuration options here
      })
    end,
  },
  -- You can add keymaps here like you did with neo-tree
  -- vim.keymap.set("n", "<leader>p", "<cmd>ProjectMgr<CR>", { desc = "Open Project Manager" })
  --
vim.api.nvim_set_keymap("n", "<leader>p", ":ProjectMgr<CR>", {}),
}
