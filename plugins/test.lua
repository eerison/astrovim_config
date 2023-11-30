-- It is WIP, there is  issue on gitbug: https://github.com/olimorris/neotest-phpunit/pull/18
local prefix = "<leader>t"

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
      status = {
        enabled = false,
        signs = false,
        virtual_text = false,
      },
      adapters = {
        args = { "--log-level", "DEBUG" },
        require "neotest-phpunit" {
          phpunit_cmd = function()
            return {
              "sh",
              "nvim/neotest.sh", -- docker compose -f docker/docker-compose.yml exec app bin/phpunit $1
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
  -- https://www.lazyvim.org/extras/test/core#neotest-1
  keys = {
    { prefix .. "t", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run File" },
    { prefix .. "T", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
    { prefix .. "r", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { prefix .. "s", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    {
      prefix .. "o",
      function() require("neotest").output.open { enter = true, auto_close = true } end,
      desc = "Show Output",
    },
    { prefix .. "O", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { prefix .. "S", function() require("neotest").run.stop() end, desc = "Stop" },
  },
}
