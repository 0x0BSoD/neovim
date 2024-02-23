local fn = vim.fn
local g = vim.g
local o = vim.o
local opt = vim.opt
local wo = vim.wo

-- Sane defaults
wo.statuscolumn = ""
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false --- Recommended by coc
opt.swapfile = false
opt.scrolloff = 10 -- always show minimum n lines after current line
opt.relativenumber = false -- Show relative numberline
opt.wrap = false
opt.iskeyword:append "-"
opt.termguicolors = true -- True color support
opt.autoindent = true --- Good auto indent
opt.backspace = "indent,eol,start" --- Making sure backspace works

-- Folds (not working)
opt.foldenable = true
opt.foldcolumn = "auto" -- show foldcolumn in nvim 0.9
opt.foldnestmax = 0
opt.foldlevel = 99
opt.foldlevelstart = 99
vim.opt.fillchars = {
  -- horiz     = '━',
  -- horizup   = '┻',
  -- horizdown = '┳',
  -- vert      = '┃',
  -- vertleft  = '┫',
  -- vertright = '┣',
  -- verthoriz = '╋',
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  stl = " ",
  eob = " ",
}
