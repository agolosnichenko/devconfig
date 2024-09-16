return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 120,
      },
      plugins = {
        options = {
          laststatus = 0,
        },
        twilight = {
          enabled = true,
        },
      },
      on_open = function()
        require("package-info").hide()
      end,
    },
    keys = {
      {
        "<leader>uz",
        function()
          return require("zen-mode").toggle()
        end,
        desc = "Toggle Zen Mode",
        mode = { "n" },
      },
    },
  },
}
