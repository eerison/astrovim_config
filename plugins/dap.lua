return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      php = function(config)
        config.adapters = {
          type = "executable",
          command = "node",
          args = { os.getenv "HOME" .. "/Documents/projects/vscode-php-debug/out/phpDebug.js" },
        }

        config.configurations = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
            pathMappings = {
              ["/app"] = "${workspaceFolder}",
            },
          },
        }
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  },
}
