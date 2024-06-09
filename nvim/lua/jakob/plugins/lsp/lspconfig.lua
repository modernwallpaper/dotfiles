local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

-- enable keybinds for available lsp servers
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds 
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["prismals"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["clangd"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
