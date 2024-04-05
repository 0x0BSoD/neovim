---@diagnostic disable: different-requires
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- Import on_attach & capabilities functions from lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- [https://github.com/lukas-reineke/lsp-format.nvim#setup]
local lspformat = require "lsp-format"
lspformat.setup {}

local servers = {
  "bashls",
  "clangd",
  "gopls",
  "helm_ls",
  "pyright",
  "yamlls",
  "dockerls",
  "cmake",
  "vimls",
}

-- Apply on_attach & capabilities to every server in the list
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Custom configurations of lsps
lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.ruff_lsp.setup {
  on_attach = function(client, _)
    -- Disable hover in favour of Pyright
    client.server_capabilities.hoverProvider = false
  end,
  capabilities = capabilities,
}
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    format = { enabled = false },
    -- anabling this conflicts between Kubernetes resources and kustomization.yaml and Helmreleases
    -- see utils.custom_lsp_attach() for the workaround
    -- how can I detect Kubernetes ONLY yaml files? (no CRDs, Helmreleases, etc.)
    validate = false,
    completion = true,
    hover = true,
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
    schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.{yml,yaml}",
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
      },
    },
  },
}

-- Definitions of tools for efm using efmls_configs
-- [https://github.com/creativenull/efmls-configs-nvim#setup]
local shellcheck = require "efmls-configs.linters.shellcheck"
local beautysh = require "efmls-configs.formatters.beautysh"
local prettier = require "efmls-configs.formatters.prettier"
local gofmt = require "efmls-configs.formatters.gofmt"
local stylua = require "efmls-configs.formatters.stylua"
local jq = require "efmls-configs.linters.jq"
local mdformat = require "efmls-configs.formatters.mdformat"
local markdownlint = require "efmls-configs.linters.markdownlint"
local black = require "efmls-configs.formatters.black"
local dprint = require "efmls-configs.formatters.dprint"
-- local yq = require "efmls-configs.formatters.yq"
local hadolint = require "efmls-configs.linters.hadolint"

-- Custom definitions of tools for lining and formatting
local yamllint = {
  prefix = "yamllint",
  lintCommand = "yamllint -c ~/.config/yamllint/extended_conf.yaml -f parsable -",
  lintStdin = true,
}

-- Table of tools per language
local langs = {
  docker = { hadolint },
  bash = { shellcheck, beautysh },
  go = { gofmt },
  json = { jq, prettier },
  lua = { stylua },
  markdown = { markdownlint, mdformat },
  python = { black },
  toml = { dprint },
  yaml = { yamllint },
}

-- efmls_configs configuration table
local efmls_config = {
  filetypes = vim.tbl_keys(langs),
  settings = {
    rootMarkers = { ".git/" },
    languages = langs,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

-- Implementation of efm as an lsp
lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {
  on_attach = lspformat.on_attach,
  capabilities = capabilities,
}))
