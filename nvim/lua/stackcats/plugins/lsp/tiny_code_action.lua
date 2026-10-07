return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    {
      "folke/snacks.nvim",
      opts = {
        terminal = {},
      },
    },
  },
  event = "LspAttach",
  opts = {
    picker = {
      "snacks",
      opts = {
        layout = "dropdown",
      },
    },
  },
  config = function(_, opts)
    vim.keymap.set({ "n", "x" }, "ga", function()
      require("tiny-code-action").code_action()
    end, { noremap = true, silent = true, desc = "LSP: Code Actions" })

    require("tiny-code-action").setup(opts)
  end,
}
