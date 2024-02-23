---@class ChadrcConfig
local M = {}

local core = require "custom.utils.coreutil"
local highlights = require "custom.highlights"

M.ui = {
  theme = "ayu_dark",

  telescope = { style = "bordered" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  nvdash = core.nvdash,
}

M.settings = {
  cc_size = "130",
  so_size = 10,
  blacklist = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
  },
}

M.lazy_nvim = core.lazy
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
