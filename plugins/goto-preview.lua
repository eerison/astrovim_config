-- https://github.com/jesseduffield/lazygit/issues/6#issuecomment-410528814
return {
  "rmagatti/goto-preview",
  config = function()
    require("goto-preview").setup {
      default_mappings = true,
    }
  end,
}
