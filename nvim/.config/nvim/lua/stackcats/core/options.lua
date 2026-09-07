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

-- fix paste content with mouse with ^M at the end of lines
if vim.fn.has("wsl") == 1 then
  local cmd = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'

  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = cmd,
      ["*"] = cmd,
    },
    cache_enabled = 0,
  }
end

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h16"
end

vim.wo.number = true
