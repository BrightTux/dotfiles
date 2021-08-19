if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Wiki + drawing
Plug 'vimwiki/vimwiki'
Plug 'gyim/vim-boxdraw'

Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" float term
Plug 'voldikss/vim-floaterm'

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" colorscheme
Plug 'ayu-theme/ayu-vim'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'

" tmux
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

"snippets from sensible vim
set complete-=i
set smarttab
set laststatus=2 "always displays the status line
set backspace=indent,eol,start

" Basic Configs
set nobackup
set nowritebackup
set number
set relativenumber
set hidden
set mouse=a     "Enables mouse click

set clipboard+=unnamedplus
filetype plugin indent on
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#002b36

syntax on
syntax enable
set autoindent
set signcolumn=yes
set shortmess+=c
set nocompatible "stop pretending to be VI

" auto wrap text
set textwidth=80
set encoding=utf-8
" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/^[^']\s\+$//e
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set cursorline
hi CursorLine ctermbg=236 cterm=none
hi CursorLineNr ctermbg=236 cterm=none

" Fuzzy finder
set rtp+=~/.fzf
set path+=**
" Quick search
nmap // :BLines<cr>
nmap ?? :Rg!<cr>

" Floatterm
let g:floaterm_title = "Floaterm ($1/$2)"
let g:floaterm_autoinsert = 1
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_wintitle = 0
let g:floaterm_autoclose = 1

nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>


" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" highlights words under cursor
autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""

set lazyredraw "redraw only when we need to, leading to faster macros
set showmatch "highlight matching [{()}]

" Display 3 lines above/below the cursor when scrolling with a mouse.
set scrolloff=3
set sidescrolloff=3

" Automatically puts search to the middle of the screen, test:
nnoremap n nzz
nnoremap N Nzt

" Set incremental search (jump to text while searching)
set incsearch
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase
" Set hilight on same text after searching
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Don't conceal in markdown
let g:vim_markdown_conceal = 0

set expandtab "tab are spaces
set tabstop=2 " number of visual spaces per tab
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set softtabstop=2 " number of spaces in tab when editing
retab

" sometimes vim removes indent for #. disable smartindent and set these
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Custom keys {{
"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>
"leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" Set vim to automatically exit `insert mode` when the up or down cursor key is pressed
inoremap <silent> <Up> <ESC><Right>
inoremap <silent> <Down> <ESC><Right>
inoremap <silent> jk <ESC>

map <C-n> :Lexplore<CR>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>
vnoremap S :s///g<Left><Left><Left>
" }}


"Remember cursor location after swapping buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Auto indent lines
" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

set listchars=tab:»·,trail:·,extends:#
set list


" Unlimited Undo:
set undodir=~/.vim/undodir " create a directory in ~/.vim/undodir
set undofile

" Setting up central swap directory:
set noswapfile
set directory=$HOME/.vim/swapfiles//

" Vim Fugitive settings {{
set diffopt+=vertical
" }}

" Signify {{
let g:signify_realtime = 0
let g:signify_cvs_list = 1
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '≉'
let g:signify_sign_changedelete      = g:signify_sign_change

highlight link SignifyLineChange DiffText
" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" }}


nmap <leader>z <Plug>(zoom-toggle)

" Windows related tools
nnoremap <leader>w <C-w>w
nnoremap <leader>q <C-W>q
nnoremap <leader>= <C-W>=
nnoremap <leader>s :vsplit<CR>

" Colors
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]


" Auto source / update vimrc file after saving it
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" For terminal bg transparency goodness :)
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect


" Avoid showing message extra message when using completion
set shortmess+=c
