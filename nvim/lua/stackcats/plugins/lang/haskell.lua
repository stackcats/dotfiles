return {
  "mrcjkb/haskell-tools.nvim",
  version = "^10",
  lazy = false,
  config = function()
    local custom = require("stackcats.plugins.utils.lsp")
    a = 10
    vim.g.haskell_tools = {
      hls = {
        on_attach = custom.attach,
      }
    }
  end
}
