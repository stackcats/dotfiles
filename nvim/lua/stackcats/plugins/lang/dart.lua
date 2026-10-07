return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    {
      "dart-lang/dart-vim-plugin",
      init = function()
        vim.g.dart_style_guide = 2
        vim.g.dart_html_in_string = true
        vim.g.dart_trailing_comma_indent = true
        vim.g.dartfmt_options = { "--fix" }
        vim.g.dart_format_on_save = 1
      end,
    },
    "Nash0x7E2/awesome-flutter-snippets",
  },
  config = function()
    local custom = require("stackcats.plugins.utils.lsp")

    require("flutter-tools").setup({
      lsp = {
        on_init = custom.on_init,
        on_attach = custom.on_attach,
        capabilities = custom.capabilities(),
      },
      decorations = {
        statusline = {
          app_version = true,
        },
      },
    })
  end,
}
