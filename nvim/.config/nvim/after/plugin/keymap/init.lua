local Remap = require("tayl0rgen.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


nmap( "<leader>vm", ":vsp $MYVIMRC<CR>", {nowait = true})
nmap( "<leader>sv", ":source $MYVIMRC<CR>", {nowait = true})

-- resize current buffer by +/- 5
-- simple way to resize when I have splits pretty much
nnoremap("<leader><Left>", ":vertical resize -5<cr>")
nnoremap("<leader><Down>", ":resize +5<cr>")
nnoremap("<leader><Up>", ":resize -5<cr>")
nnoremap("<leader><Right>", ":vertical resize +5<cr>")

inoremap("jk", "<esc>")
nnoremap("<leader>nt", ":Ex<CR>", {silent=true})
--tmux sessionizer
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<Leader><space>", ":noh<cr>")
-- greatest remaps ever from primeagen
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
vnoremap("<leader>'", "<esc>`>a'<esc>`<i'<esc>")
vnoremap("<leader>\"", "<esc>`>a\"<esc>`<i\"<esc>")
vnoremap("<leader>(", "<esc>`>a)<esc>`<i(<esc>")
vnoremap("<leader>[", "<esc>`>a]<esc>`<i[<esc>")
vnoremap("<leader>{", "<esc>`>a}<esc>`<i{<esc>")
--

-- format buffer
nnoremap("<leader>for", function()
    vim.lsp.buf.format()
end)

-- Undo breakpoints
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("?", "?<c-g>u")
inoremap("[", "[<c-g>u")
inoremap("]", "]<c-g>u")
inoremap("{", "{<c-g>u")
inoremap("}", "}<c-g>u")

--remaps for tabs
-- Tab navigation like Firefox.
nnoremap("<C-l>", "gt<CR>")
nnoremap("<C-h>", "gT<CR>")
nnoremap("<C-t>", ":tabnew<CR>")
nnoremap("<C-l>", "gt<CR>")
nnoremap("<C-h>", "gT<CR>")
nnoremap("<C-t>", ":tabnew<CR>")
nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

--Jupyter Magma Keybindings
nnoremap("<Leader>r", "<cmd>MagmaEvaluateOperator<CR>", {expr=true, silent=true})
nnoremap("<Leader>rr", "<cmd>MagmaEvaluateLine<CR>", {silent=true})
xnoremap("<Leader>r", ":<C-u>MagmaEvaluateVisual<CR>", {silent=true, nowait=true})
nnoremap("<Leader>rc", "<cmd>MagmaReevaluateCell<CR>", {silent=true})
nnoremap("<Leader>rd", "<cmd>MagmaDelete<CR>", {silent=true})
nnoremap("<Leader>ro", "<cmd>MagmaShowOutput<CR>", {silent=true})
nnoremap("<Leader>eo", "<cmd>noautocmd MagmaEnterOutput<CR>", {silent=true})


nnoremap("<Leader>so", "<cmd>SymbolsOutlineOpen<CR>", {silent=true})

--Write current buff, close all others
nnoremap("<leader>wbco", "<cmd>w | %bd | e#<CR>")
