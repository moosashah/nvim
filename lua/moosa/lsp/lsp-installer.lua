local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "gopls",
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "jsonls",
  "yamlls",
  "tailwindcss",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}
for _, server in pairs(servers) do
  opts = {
    on_attach = require('moosa.lsp.handlers').on_attach,
    capabilities = require('moosa.lsp.handlers').capabilities,
  }

  if server == 'tsserver' then
    local tsserver_opts = require 'moosa.lsp.settings.tsserver'
    opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
  end

  if server == 'gopls' then
    local gopls_opts = require 'moosa.lsp.settings.gopls'
    opts = vim.tbl_deep_extend('force', gopls_opts, opts)
  end

  if server == 'sumneko_lua' then
    local sumneko_opts = require 'moosa.lsp.settings.sumneko_lua'
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  lspconfig[server].setup(opts)
end
