require("tayl0rgen.set")
require("tayl0rgen.packer")
require("tayl0rgen.keymap")
require("tayl0rgen.telescope")

local augroup = vim.api.nvim_create_augroup
EinGroup = augroup('Ein', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = EinGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = EinGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

