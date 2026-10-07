return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      -- :help bufferline-hover-events
      hover = {
        enabled = true,
        delay = 25,
        reveal = { "close" },
      },
      themable = true,
    },
  },
  config = function(_, opts)
    vim.opt.mousemoveevent = true
    vim.opt.termguicolors = true

    require("bufferline").setup(opts)
  end,
}
