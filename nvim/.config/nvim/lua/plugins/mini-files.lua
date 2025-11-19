return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    require("mini.files").setup({
      -- Customization of shown content
      content = {
        filter = nil,
        prefix = nil,
        sort = nil,
      },

      -- Module mappings created only inside explorer
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
      },

      -- General options
      options = {
        permanent_delete = true,
        use_as_default_explorer = true,
      },

      -- Customization of explorer windows
      windows = {
        max_number = math.huge,
        preview = false,
        width_focus = 30,
        width_nofocus = 15,
        width_preview = 50,
      },
    })

    -- Auto-close when opening a file
    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        local new_target_window
        local cur_target_window = require("mini.files").get_target_window()
        if cur_target_window ~= nil then
          vim.api.nvim_win_call(cur_target_window, function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)
          require("mini.files").set_target_window(new_target_window)
          require("mini.files").go_in()
        end
      end
      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Close on file open with default go_in mapping
        vim.keymap.set("n", "l", function()
          local MiniFiles = require("mini.files")
          local fs_entry = MiniFiles.get_fs_entry()

          if fs_entry and fs_entry.fs_type == "file" then
            MiniFiles.go_in()
            vim.defer_fn(function()
              MiniFiles.close()
            end, 10)
          else
            MiniFiles.go_in()
          end
        end, { buffer = buf_id, desc = "Go in and close on file" })

        -- Optional: split mappings
        map_split(buf_id, "<C-s>", "belowright horizontal")
        map_split(buf_id, "<C-v>", "belowright vertical")
      end,
    })

    -- Set keymap to toggle mini.files
    vim.keymap.set("n", "<leader>e", function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0))
    end, { desc = "Toggle Mini Files" })
  end,
}
