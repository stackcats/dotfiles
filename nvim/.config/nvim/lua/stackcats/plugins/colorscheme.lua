return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        -- transparent = true,
      })
    end,
  },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
      on_highlights = function(hl, c)
        -- winbar highlights
        hl.WinBar = { bg = "none", fg = c.blue, bold = true }
        hl.WinBarNC = { bg = "none", fg = c.comment }
      end,
    },
  },
}
