call plug#begin()
"Plugin Section
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Plebvim lsp Plugins - from ThePrimeagen mostly
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

"Harpoon by ThePrimeagen 
Plug 'ThePrimeagen/harpoon'

" Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Treesitter -----------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'p00f/nvim-ts-rainbow'
"----------------------------
"telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"NeoFormat
Plug 'sbdchd/neoformat'
call plug#end()

"making nvim harder than it needs to be, lol
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

set clipboard+=unnamedplus
let g:clipboard = {
  \   'name': 'win32yank-wsl',
  \   'copy': {
  \      '+' : 'win32yank.exe -i --crlf',
  \      '*' : 'win32yank.exe -i --crlf',
  \   },
  \   'paste': { 
  \      '+' : 'win32yank.exe -o --lf',
  \      '*' : 'win32yank.exe -o --lf',
  \   },
  \   'cache_enabled': 0,
  \ }



let mapleader= " "

inoremap jk <esc>

"Remaps for Harpoon-----------------
"-----------------------------------
"-----------------------------------
"-----------------------------------


" left index finger
nnoremap <nowait><Leader><space>f :lua require("harpoon.ui").toggle_quick_menu()<CR>

" lift the finger to do sth dangerous
nnoremap <nowait><Leader><space>g :lua require("harpoon.mark").add_file()<CR>

" right home row, no finger lifting required
nnoremap <nowait><Leader><space>j :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <nowait><Leader><space>k :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <nowait><Leader><space>l :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <nowait><Leader><space>; :lua require("harpoon.ui").nav_file(4)<CR>

"MY ORIGINAL DEFAULTS
"
"map <leader>mm :lua require("harpoon.mark").add_file()<cr>
"map <leader>ml :lua require("harpoon.ui").toggle_quick_menu()<cr>
"
""navigates to next mark
nnoremap <nowait><Leader><space>h :lua require("harpoon.ui").nav_next()<cr>  
"
""navigates to previous mark
"map <leader>md :lua require("harpoon.ui").nav_prev()<cr>  
"
""navigates to file specifically
"map <leader>11 :lua require("harpoon.ui").nav_file(1)<cr>
"map <leader>22 :lua require("harpoon.ui").nav_file(2)<cr>
"map <leader>33 :lua require("harpoon.ui").nav_file(3)<cr>
"map <leader>44 :lua require("harpoon.ui").nav_file(4)<cr>

"-----------------------------------
"-----------------------------------
"-----------------------------------
"-----------------------------------


"Remap for pasting
vnoremap <leader>p "_dP


"-----------------------------------
"-----------------------------------
"remaps for switching windows/saving/buffer delete/etc
"-----------------------------------
"-----------------------------------
nnoremap <leader><space>q :q<cr>
nnoremap <leader><space>w :w<cr>
nnoremap <leader><space>wq :wq<cr>
nnoremap <leader><space>ee :bd<cr>

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <Leader><space> :noh<cr>

"$MYVIMRC remaps
"----------------------------------
"Opens init.vim
map <nowait><leader>vm :vsp $MYVIMRC<CR>

"Sources init.vim
map <nowait><leader>sv :source $MYVIMRC<CR>

"----------------------------------
"ThePrimeagen top 5 remaps video stuff I liked
"----------------------------------
"----------------------------------
"wraps the highlighted text in quotes, brackets, etc
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

"remaps big y (Y) to highlight and yank from cursor to line end
nnoremap Y y$

"Keeps things centered when doing line concatenation and also moving through
"search results
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u

"Moving Text in Visual Mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"----------------------------------
"----------------------------------
"----------------------------------
"----------------------------------

"Good status line I found from reddit lol, using it so far!
set statusline=%f\ \ %y%m%r%h%w%=[%l,%v]\ \ \ \ \ \ [%L,%p%%]\ %n


"coc bindings test

	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

"-------------------------------------
"-------------------------------------
"-------------------------------------
"COC SETTINGS BEGIN ------------------
"-------------------------------------
"-------------------------------------
"-------------------------------------

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"-------------------------------------
"-------------------------------------
"-------------------------------------
"COC SETTINGS END
"-------------------------------------
"-------------------------------------
"-------------------------------------



"-------------------------------------
" Bracket stuff

"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle



"-------------------------------------
"treesitter crap
"-------------------------------------
"
lua <<EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  
}
EOF
"-------------------------------------
"----------Telescope Stuff------------
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"----------------------------------------------------------------------------
"----------------------------------------------------------------------------
" nerdtree stuff
nnoremap <leader>nn :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"----------------------------------------------------------------------------
"----------------------------------------------------------------------------

"             COLOR SCHEME & BACKGROUND TRANSPARENCY SETTING
colorscheme gruvbox
highlight Normal ctermbg=none
"----------------------------------------------------------------------------

"----------------------------------------------------------------------------
"           Reddit whitespace marking thing - uncomment to use
"match errorMsg /\s\+$/
"----------------------------------------------------------------------------

set nobomb
set nocompatible            " disable compatibility to old-time vi
set scrolloff=7             " 7 lines for scrolling
set showmatch               " show matching
set mouse=""                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set number                  " add line numbers
set relativenumber
set wildoptions+=pum
set wildmode=longest:full,full
"set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
"filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
"set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on            " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
 
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

