return {
  {
    "williambuman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williambuman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {"jdtls"},
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )
      
      -- Using the new vim.lsp.config API instead of lspconfig
      vim.lsp.config.tailwindcss = {
        capabilities = capabilities,
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
        root_markers = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.cjs" }
      }
      
      vim.lsp.config.ruby_lsp = {
        capabilities = capabilities,
        cmd = { "ruby-lsp" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile", ".git" }
      }
      
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = {'vim'}
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
              enable = false
            }
          }
        }
      }
      
      vim.lsp.config.jdtls = {
        capabilities = capabilities,
        cmd = { "jdtls" },
        filetypes = { "java", "kotlin" },
        root_markers = { "build.gradle", "build.gradle.kts", "pom.xml", ".git" }
      }
      
      -- Set up keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end,
  },
}
