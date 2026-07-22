vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("stackcats.core")
require("stackcats.lazy")

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.cmd("colorscheme rose-pine")
