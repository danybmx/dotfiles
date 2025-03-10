return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      python = function(source_name)
        local dap = require "dap"

        dap.configurations.java = {
          {
            type = "java",
            request = "attach",
            name = "Debug (Attach) - Remote",
            hostName = "127.0.0.1",
            port = 5566,
          },
        }
      end,
    },
  },
}
