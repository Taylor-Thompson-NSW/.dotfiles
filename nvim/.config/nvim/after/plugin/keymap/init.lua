vim.keymap.set("n", "<leader>vm", ":vsp $MYVIMRC<CR>", { nowait = true })
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { nowait = true })

-- resize current buffer by +/- 5
-- simple way to resize when I have splits pretty much
vim.keymap.set("n", "<leader><Left>", ":vertical resize -5<cr>")
vim.keymap.set("n", "<leader><Down>", ":resize +5<cr>")
vim.keymap.set("n", "<leader><Up>", ":resize -5<cr>")
vim.keymap.set("n", "<leader><Right>", ":vertical resize +5<cr>")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>nt", ":Ex<CR>", { silent = true })
--tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<Leader><space>", ":noh<cr>")
-- greatest remaps ever from primeagen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>")
vim.keymap.set("v", "<leader>\"", "<esc>`>a\"<esc>`<i\"<esc>")
vim.keymap.set("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>")
vim.keymap.set("v", "<leader>[", "<esc>`>a]<esc>`<i[<esc>")
vim.keymap.set("v", "<leader>{", "<esc>`>a}<esc>`<i{<esc>")
--
--search and replace
vim.keymap.set("n", "<leader>sar", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- format buffer
vim.keymap.set("n", "<leader>for", function()
  vim.lsp.buf.format()
end)

-- Undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
vim.keymap.set("i", "[", "[<c-g>u")
vim.keymap.set("i", "]", "]<c-g>u")
vim.keymap.set("i", "{", "{<c-g>u")
vim.keymap.set("i", "}", "}<c-g>u")

--remaps for tabs
-- Tab navigation like Firefox.
vim.keymap.set("n", "<C-l>", "gt<CR>")
vim.keymap.set("n", "<C-h>", "gT<CR>")
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-l>", "gt<CR>")
vim.keymap.set("n", "<C-h>", "gT<CR>")
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

vim.keymap.set("n", "<Leader>so", "<cmd>SymbolsOutlineOpen<CR>", { silent = true })

--Write current buff, close all others
vim.keymap.set("n", "<leader>wbco", "<cmd>w | %bd | e#<CR>")
