-- return {
--   "potamides/pantran.nvim",
--
--   keys = {
--     {
--       "<leader>tr",
--       function() require("pantran").motion_translate() end,
--       mode = { "n", "v" },
--       desc = "Translate",
--     },
--   },
--
--   opts = {},
--
--   config = function(_, opts) require("pantran").setup(opts) end,
-- }
local prefix = "<leader>tr"
return {
  "potamides/pantran.nvim",
  event = "VimEnter",
  config = function()
    local pantran = require "pantran"
    -- pantran.setup {}
    pantran.setup {
      default_engine = "google",
      engines = {
        google = {
          fallback = {
            default_source = "auto",
            default_target = "pt-br",
          },
        },
      },
    }

    local opts = { noremap = true, silent = true, expr = true }
    vim.keymap.set("n", "<Leader>tr", pantran.motion_translate, opts)
    vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opts)
    vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
  end,
}
