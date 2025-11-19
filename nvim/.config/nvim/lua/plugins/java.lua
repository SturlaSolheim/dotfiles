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
    require("java").setup({
      root_markers = {
        ".git",
        "pom.xml",
        "build.gradle",
        "gradlew",
      },
      spring_boot_tools = {
        enable = true,
      },
      jdtls = {
        setup_dap = false,
      },
    })

    -- Setup lspconfig after java setup
    require("lspconfig").jdtls.setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        java = {
          configuration = {
            maven = {
              userSettings = vim.fn.expand("/usr/share/maven/conf/settings.xml"),
            },
          },
          import = {
            maven = {
              enabled = true,
            },
          },
          maven = {
            downloadSources = true,
          },
        },
      },
      cmd_env = {
        MAVEN_HOME = "/usr/share/maven",
        M2_HOME = "/usr/share/maven",
      },
    })
  end,
}
