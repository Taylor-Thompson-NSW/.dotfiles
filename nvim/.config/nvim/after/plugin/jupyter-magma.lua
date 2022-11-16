require("tayl0rgen.keymap")

local Remap = require("tayl0rgen.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap

nnoremap("<Leader>r", ":MagmaEvaluateOperator<CR>", {silent = true, expr = true})
nnoremap("<Leader>rr", ":MagmaEvaluateLine<CR>", {silent = true})
xnoremap("<Leader>r ", ":<C-u>MagmaEvaluateVisual<CR>", {silent = true})
nnoremap("<Leader>rc", ":MagmaReevaluateCell<CR>", {silent = true})
nnoremap("<Leader>rd", ":MagmaDelete<CR>", {silent = true})
nnoremap("<Leader>ro", ":MagmaShowOutput<CR>", {silent = true})
nnoremap("<Leader>eo", ":noautocmd MagmaEnterOutput<CR>", {silent = true})

vim.cmd('let g:magma_automatically_open_output = v:false')
vim.cmd('let g:magma_wrap_output = v:false')
vim.cmd('let g:magma_image_provider = "ueberzug"')
