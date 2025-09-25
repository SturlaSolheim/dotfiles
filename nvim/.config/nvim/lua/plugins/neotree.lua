return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer
          leave_dirs_open = true, -- `false` closes auto expanded dirs
        },
        use_libuv_file_watcher = true,
      },
    })
    
    -- Set keymap here inside the config function
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
  end
}
