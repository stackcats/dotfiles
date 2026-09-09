local opt = vim.opt

opt.autoindent = true
opt.cursorline = true
opt.encoding = "utf-8"
opt.fileencodings = "utf-8"
opt.fileformat = "unix"
opt.showtabline = 0
opt.signcolumn = "yes:1"
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true
-- opt.cmdheight = 0

if jit.os == "OSX" then
  opt.clipboard = "unnamed"
else
  opt.clipboard = "unnamedplus"
end

local is_wsl = (vim.fn.has("wsl") == 1)

local function has(cmd)
  return vim.fn.executable(cmd) == 1
end

if is_wsl then
  if has("xclip") then
    vim.g.clipboard = {
      name = "xclip",
      copy = {
        ["+"] = { "xclip", "-selection", "clipboard" },
        ["*"] = { "xclip", "-selection", "primary" },
      },
      paste = {
        ["+"] = { "sh", "-c", "xclip -selection clipboard -o | tr -d '\\r'" },
        ["*"] = { "sh", "-c", "xclip -selection primary -o | tr -d '\\r'" },
      },
      cache_enabled = 0,
    }
  end
end

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h16"
end

vim.wo.number = true
