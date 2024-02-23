local M = {}

M.lspconfig = function()
  require "plugins.configs.lspconfig"
  require "custom.configs.lspconfig"
end -- Override to setup mason-lspconfig

M.treesitter = {
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "go",
    "yaml",
    "toml",
    "json",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "efm",

    -- bash
    "bash-language-server",
    "beautysh",
    "shellcheck",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- markdown
    "marksman",
    "misspell",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",

    -- go
    "gopls",
    "glint",
    "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",
    "gotestsum",

    -- python
    "pyright",
    "flake8",
    "black",
    "mypy",
    "pydocstyle",
    "pylint",
    "pyre",
    "autoflake",
    "autopep8",
    "python-lsp-server",
    "debugpy",
    "ruff",

    -- yaml
    "yaml-language-server",
    "yamlfmt",
    "yamllint",
    "helm_ls",

    -- sql
    "sqlfluff",
    "sqls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        -- git = true,
      },
      glyphs = {
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      },
    },
  },
}

return M
