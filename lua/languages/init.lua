local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'gD', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
  vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
  vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  vim.keymap.set('n', '<leader>bf', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', bufopts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['solargraph'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['lua_ls'].setup {
  flags = lsp_flags,
  on_attach = on_attach,
}

require('lspconfig')['tailwindcss'].setup {
  flags = lsp_flags,
}

require('lspconfig')['elixirls'].setup {
  cmd = { "/Users/zhenchao/.bin/language_server.sh" };
  flags = lsp_flags,
  on_attach = on_attach,
}

require('languages.null-ls')
