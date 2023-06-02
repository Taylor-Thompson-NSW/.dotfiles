local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "astro" },
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		null_ls.builtins.diagnostics.fish,
	},
})
