if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" >> load plugins
call plug#begin(stdpath('data') . 'vimplug') 
    Plug 'nvim-lua/plenary.nvim' 
    Plug 'nvim-lua/popup.nvim' 
    Plug 'nvim-telescope/telescope.nvim' 
    Plug 'neovim/nvim-lspconfig' 
    Plug 'kabouzeid/nvim-lspinstall' 
    Plug 'glepnir/lspsaga.nvim' 
    Plug 'hrsh7th/nvim-compe' 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' } 
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

    Plug 'NLKNguyen/papercolor-theme'

    Plug 'tpope/vim-ragtag' 
    Plug 'tpope/vim-surround' 
    Plug 'tpope/vim-unimpaired'

    Plug 'tpope/vim-eunuch' 
    Plug 'tpope/vim-fugitive'

    " Clarence
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'gyim/vim-boxdraw'
    Plug 'vimwiki/vimwiki'

    Plug 'mhinz/vim-signify'
    Plug 'voldikss/vim-floaterm'

    Plug 'tpope/vim-commentary'

    Plug 'ayu-theme/ayu-vim'
    Plug 'ap/vim-css-color'
    Plug 'Yggdroot/indentLine'

    Plug 'christoomey/vim-tmux-navigator'

    " Snippets 
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'



call plug#end()

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}



" Autocmd commands
autocmd BufWritePre * %s/^[^']\s\+$//e " Automatically deletes all tralling whitespace on save.
" autocmd BufEnter * silent! lcd %:p:h " sane: set autochdir

" Syntax
syntax on
syntax enable

" Custom leader key
let mapleader = "\<Space>"

" basic settings
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set clipboard+=unnamedplus
set colorcolumn=80
set cursorcolumn 
set swb=split
set cursorline
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase         " ignore case
set incsearch          " do incremental searching
set lazyredraw         " redraw only when we need to, leading to faster macros
set list
set listchars=tab:»·,trail:·,extends:#
set mouse=a            " mouse support
set nocompatible
set noswapfile
set number
set relativenumber
set ruler
set shiftwidth=2
set showmatch       "highlight matching [{()}]
set scrolloff=3     " Display 3 lines above/below the cursor when scrolling with a mouse.
set sidescrolloff=3 " Display 3 lines above/below the cursor when scrolling with a mouse.
set signcolumn=yes
set smartcase       " but don't ignore it, when search string contains uppercase letters
set smartindent
set splitbelow 
set splitright
set tabstop=2
set termguicolors
set undodir=~/.vim/undodir " create a directory in ~/.vim/undodir
set undofile               " unlimited undo
set virtualedit=all
set visualbell
" set laststatus=2 "always displays the status line

let ayucolor="dark"
colorscheme ayu

highlight CursorLine ctermbg=236 cterm=none
highlight CursorLineNr ctermbg=236 cterm=none
highlight ColorColumn ctermbg=0 guibg=#002b36


" Custom keymaps
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" turn off search highlight
nnoremap <Esc> :nohlsearch<CR>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>
vnoremap S :s///g<Left><Left><Left>

"Tab to switch to next open buffer
"Shift + Tab to switch to previous open buffer
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

"leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" Set vim to automatically exit `insert mode` when the up or down cursor key is pressed
inoremap <silent> <Up> <ESC><Right>
inoremap <silent> <Down> <ESC><Right>
inoremap <silent> jk <ESC>

" Ctrl-q to delete buffer in normal mode
nnoremap <c-q> :bd<CR>

" Automatically puts search to the middle of the screen
nnoremap n nzz
nnoremap N Nzt

" Clip to system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <leader>r to run visually select lines in bash 
vnoremap <Leader>r :w !bash<CR>

" >> Telescope bindings
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.builtin{}<CR>
" most recently used files
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>
" find buffer
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>
" find in current buffer
nnoremap // <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>
" git files
nnoremap <Leader>g <cmd>lua require'telescope.builtin'.git_branches{}<CR>
" all files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files{}<CR>
" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>
" File explorer 
" map <C-n> :Lexplore<CR>
nnoremap <Leader>e <cmd>lua require'telescope.builtin'.file_browser{}<CR>

if has('nvim')
  " Map ESC/jk as escape character 
  tnoremap <Esc> <C-\><C-n>
  tnoremap <Leader>jk <C-\><C-n>

  " Moving across splits in terminal mode
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif


" For terminal bg transparency goodness :)
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

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

" Floatterm
let g:floaterm_title = "Floaterm ($1/$2)"
let g:floaterm_autoinsert = 1
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_wintitle = 0
let g:floaterm_autoclose = 1

nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
" nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
" xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
" nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>
"
let g:mkdp_markdown_css = '~/vimwiki/retro.css'

lua <<EOF
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
EOF
