local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   })
-- end

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
  },
}
