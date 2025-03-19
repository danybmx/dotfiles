return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-dap",
    {
      "mfussenegger/nvim-dap",
      config = function() end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            settings = {
              java = {
                configuration = {
                  runtimes = {
                    {
                      name = "JavaSE-21",
                      path = "/Users/drodriguez/.sdkman/candidates/java/current",
                    },
                  },
                },
              },
            },
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({
              jdk = {
                auto_install = false,
              },
              root_markers = {
                "settings.gradle",
                "settings.gradle.kts",
                "pom.xml",
                "build.gradle",
                "mvnw",
                "gradlew",
                "build.gradle",
                "build.gradle.kts",
              },
            })
          end,
        },
      },
    },
  },
}
