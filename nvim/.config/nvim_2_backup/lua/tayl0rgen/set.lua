vim.opt.scrolloff=7
vim.opt.showmatch=true
vim.opt.mouse=""
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.expandtab=true
vim.opt.shiftwidth=2
vim.opt.number=true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber=true
vim.opt.wildoptions:append('pum')
vim.opt.wildmode = {'list', 'longest'}
vim.opt.colorcolumn = "80"
--statusline from reddit that I like
vim.opt.statusline="%f %y%m%r%h%w%=[%l,%v] [%L,%p%%] %n"

--
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
--
vim.opt.clipboard= "unnamedplus"
vim.opt.ttyfast=true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
--Ignore files
vim.opt.wildignore:append('*.pyc')
vim.opt.wildignore:append('*_build/*')
vim.opt.wildignore:append('**/coverage/*')
vim.opt.wildignore:append('**/node_modules/*')
vim.opt.wildignore:append('**/android/*')
vim.opt.wildignore:append('**/ios/*')
vim.opt.wildignore:append('**/.git/*')

vim.g.mapleader=" "
