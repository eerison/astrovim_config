-- It is WIP, there is  issue on gitbug: https://github.com/olimorris/neotest-phpunit/pull/18
return {
  "nvim-neotest/neotest",
  -- lazy = true,
  dependencies = {
    "eerison/neotest-phpunit",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
  },
  config = function()
    require("neotest").setup {
      running = {
        concurrent = true,
      },
      adapters = {
        args = { "--log-level", "DEBUG" },
        require "neotest-phpunit" {
          phpunit_cmd = function()
            return {
              "docker-compose",
              "-f",
              "docker/docker-compose.yml",
              "exec",
              "app",
              "bin/phpunit",
            }
          end,

          transform_spec_path = function(path)
            local prefix = require("neotest-phpunit").root(path)
            return string.sub(path, string.len(prefix) + 2, -1)
          end,
          results_path = "var/nvim/phpunit.output",
        },
      },
    }
  end,
}
