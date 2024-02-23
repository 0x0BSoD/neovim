local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,

  -- go
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,
}

null_ls.setup {
  debug = false,
  sources = sources,
}

-- Add autocmds to run formatting on save for .go and .py files
vim.cmd [[
  augroup null_ls_formatting
    autocmd!
    autocmd BufWritePre *.go lua vim.lsp.buf.format((nil, 1000)
    autocmd BufWritePre *.py lua vim.lsp.buf.format((nil, 1000)
  augroup END
]]
