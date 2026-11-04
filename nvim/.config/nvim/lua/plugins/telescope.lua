return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    -- =====================================================================
    -- DIN NYE PROSJEKTMENY (<leader>p)
    -- =====================================================================
    vim.keymap.set('n', '<leader>p', function()
      -- 1. Legg inn dine egne prosjekter og nøyaktige filstier her
      local mine_prosjekter = {
        { navn = "Skatteetaten", sti = "~/notater/skatteetaten/index.md" },
        { navn = "privat",         sti = "~/notater/privat/index.md" },
        { navn = "zshrc",         sti = "~/dotfiles/zshrc/.zshrc" },
        { navn = "ekom",         sti = "~/git/ekom/multikanal-utsending.json" },
      }

      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      pickers.new({}, {
        prompt_title = "Velg Prosjekt",
        finder = finders.new_table({
          results = mine_prosjekter,
          entry_maker = function(entry)
            return {
              value = entry.sti,
              display = entry.navn,
              ordinal = entry.navn,
            }
          end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            
            -- Åpner den nye filen
            vim.cmd("edit " .. vim.fn.expand(selection.value))
          end)
          return true
        end,
      }):find()
    end, { desc = "Åpne spesifikk prosjektfil" })

  end
}
