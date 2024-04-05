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
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]


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
