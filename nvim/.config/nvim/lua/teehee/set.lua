-- Configs
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.termguicolors = true
vim.o.background = "light"

-- Syntax highlights mapping
local links = {
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Special",
  ["@function"] = "Function",
  ["@function.builtin"] = "Special",
  ["@keyword"] = "Keyword",
  ["@keyword.function"] = "Keyword",
  ["@string"] = "String",
  ["@comment"] = "Comment",
  ["@type"] = "Type",
  ["@tag"] = "Label",
  ["@attribute"] = "PreProc",
  ["@number"] = "Number",
}

for from, to in pairs(links) do
  vim.cmd(("hi! link %s %s"):format(from, to))
end
