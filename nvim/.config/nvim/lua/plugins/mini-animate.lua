return {
  "echasnovski/mini.animate",
  version = false,
  config = function()
    require("mini.animate").setup({
      -- Cursor path
      cursor = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),
      },
      -- Vertical scroll
      scroll = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
      },
      -- Window resize
      resize = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),
      },
      -- Window open
      open = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
      },
      -- Window close
      close = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
      },
    })
  end,
}
