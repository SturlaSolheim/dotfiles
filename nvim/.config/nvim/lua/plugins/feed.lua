return {
   "neo451/feed.nvim",
   cmd = "Feed",
   dependencies = {
      "nvim-treesitter/nvim-treesitter", -- for feed parsing
   },
   ---@module 'feed'
   ---@type feed.config
   opts = {
      feeds = {
         {
            url = "https://github.com/neovim/neovim/releases.atom",
            title = "Neovim Releases",
            tags = { "neovim", "releases" },
         },
         {
            url = "https://this-week-in-rust.org/rss.xml",
            title = "This Week in Rust",
            tags = { "rust", "programming" },
         },
         {
            url = "https://planet.emacslife.com/atom.xml",
            title = "Planet Emacs",
            tags = { "emacs", "programming" },
         },
      },
      search = {
         ignorecase = true,
      },
      keymaps = {
         ["<CR>"] = "open_entry",
         ["q"] = "close",
         ["r"] = "refresh_feed",
         ["s"] = "search",
         ["t"] = "toggle_read",
         ["d"] = "delete_entry",
      },
   },
}
