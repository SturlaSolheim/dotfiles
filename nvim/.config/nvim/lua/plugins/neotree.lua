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
      window = {
        auto_expand_width = true,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      filesystem = {

      filtered_items = {
        visible = false, -- hide filtered items on open
        hide_gitignored = true,
        hide_dotfiles = false,
        hide_by_name = {
          ".github",
          ".gitignore",
          "package-lock.json",
          ".changeset",
          ".prettierrc.json",
        },
        never_show = { ".git" },
      },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer
          leave_dirs_open = true, -- `false` closes auto expanded dirs
        },
        use_libuv_file_watcher = true,
      },
    })
    
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
  end
}
