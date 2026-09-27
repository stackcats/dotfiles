return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      transparent = true,
      on_highlights = function(hl, c)
        -- winbar highlights
        hl.WinBar = { bg = "none", fg = c.blue, bold = true }
        hl.WinBarNC = { bg = "none", fg = c.comment }

        -- nvim-lsp-endhints
        hl.LspInlayHint = { bg = "none", fg = c.comment }
      end,
    },
  },
}
