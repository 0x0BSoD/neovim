local overrides = require "custom.configs.overrides"

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.o.spell = false

---@type NvPluginSpec[]
local plugins = {
  -- Overrides
  {
    "neovim/nvim-lspconfig",
    opts = overrides.lspconfig,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Plugins
  { import = "custom.configs.user.better-escape" },
  { import = "custom.configs.user.diffview" },
  { import = "custom.configs.user.dressing" },
  { import = "custom.configs.user.efmls-configs" },
  { import = "custom.configs.user.fine-cmdline" },
  { import = "custom.configs.user.fugitive" },
  { import = "custom.configs.user.hover" },
  { import = "custom.configs.user.lsp-format" },
  { import = "custom.configs.user.lsp-signature" },
  { import = "custom.configs.user.lspsaga" },
  { import = "custom.configs.user.md-preview" },
  { import = "custom.configs.user.notify" },
  { import = "custom.configs.user.searchbox" },
  { import = "custom.configs.user.trouble" },
  { import = "custom.configs.user.vim-helm" },
  { import = "custom.configs.user.dashboard-nvim" }
}

return plugins
