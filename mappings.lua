-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["gp"] = {
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      noremap = true,
    },
    ["<C-u>"] = {
      "<C-u>zz<CR>",
      noremap = true,
    },
    ["<C-d>"] = {
      "<C-d>zz",
      noremap = true,
    },
    ["<C-f>"] = {
      "<C-f>zz<CR>",
      noremap = true,
    },
    ["<C-b>"] = {
      "<C-b>zz",
      noremap = true,
    },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    --["<leader>tts"] = { "<cmd>:TermExec cmd='echo \"ls -la\"'<cr>", desc = "Test suite" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = false,
    ["<leader>tts"] = {
      "<cmd>:TermExec cmd='APP_ENV=test php -dmemory_limit=2000M bin/phpunit -c test/phpunit_parallel_jenkins.xml --log-junit tests/_output/actionAndBankAccount.xml --no-coverage --testsuite ;'<cr>",
      desc = "Test suit",
    },
  },
}
