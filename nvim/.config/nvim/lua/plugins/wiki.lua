return {
  "echaya/neowiki.nvim",
  lazy = false,
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Crucial for structural maps
  keys = {
    { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
  },
  opts = {
    -- Put your existing wiki_dirs and setups here
    wiki_dirs = {
      { name = "Skatteetaten", path = "~/notater/skatteetaten" },
      { name = "Privat", path = "~/notater/privat" },
    },
  },
  config = function(_, opts)
    -- This enforces that neowiki configures the backend properly
    require("neowiki").setup(opts)
    
    -- Force lazy to inject buffer local keys onto active markdown files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        -- Directly forces neowiki to check and map the local buffer
        pcall(require("neowiki").setup_buffer) 
      end,
    })
  end,
}
