return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- Setup nvim-java before lspconfig
    require("java").setup({
      root_markers = {
        ".git",
        "pom.xml",
      },
    })

    -- Get capabilities from nvim-cmp if available
    local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = has_cmp and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

    -- Configure jdtls with vim.lsp.config
    vim.lsp.config('jdtls', {
      capabilities = capabilities,
      settings = {
        java = {
          configuration = {
            runtimes = {
              -- Uncomment and adjust if you have multiple Java versions
              -- {
              --   name = "JavaSE-23",
              --   path = "/usr/local/sdkman/candidates/java/23-tem",
              -- },
            },
          },
        },
      },
    })
  end,
}
