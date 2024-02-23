---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    [":"] = {
      "<cmd>FineCmdline<CR>",
      opts = { nowait = true, noremap = true },
    },
    [";"] = {
      "<cmd>FineCmdline<CR>",
      opts = { nowait = true, noremap = true },
    },
    ["<CR>"] = { "gf" },
    ["<C-z>"] = { "<nop>", opts = { nowait = true, noremap = true } },
    ["<C-S-z>"] = { "<nop>", opts = { nowait = true, noremap = true } },
  },

  v = {
    -- Prevent cursor from jumping back to where selection started when yanking
    ["y"] = { "ygv<esc>" },
  },

  i = {
    -- Ctrl + Backspace removes a whole word (just like other apps)
    ["C-BS"] = { "<Esc>cvb" },
  },
}

M.md_preview = {
  plugin = true,
  n = {
    ["<leader>mp"] = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" },
  },
}

M.searchbox = {
  plugin = true,
  n = {
    ["<leader>s"] = {
      "<cmd>SearchBoxIncSearch<CR>",
      "Enter Searchbox",
      opts = { noremap = true },
    },
    ["<leader>r"] = {
      "<cmd>SearchBoxReplace<CR>",
      "Enter Replace Searchbox",
      opts = { noremap = true },
    },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      "<cmd>TroubleToggle<CR>",
      "Toggle Trouble panel on/off",
    },
  },
}

return M
