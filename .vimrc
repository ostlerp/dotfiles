call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'webdevel/tabulous'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
Plug 'djoshea/vim-autoread'
Plug 'thaerkh/vim-workspace'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'jremmen/vim-ripgrep'
Plug 'ap/vim-buftabline'
Plug 'TaDaa/vimade'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'rafaqz/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" configs
set autoindent
set clipboard=unnamedplus
set expandtab
set formatoptions-=cro
set hidden
set ignorecase
set inccommand=nosplit
set incsearch
set laststatus=0
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
set mouse=nv
set nobackup
set noruler
set noswapfile
set nowrap
set number relativenumber
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undodir

syntax on
colorscheme gruvbox

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" buftabline settings
let g:buftabline_numbers = 1

" ranger settings
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
map - :RangerEdit<CR>

" vimade
autocmd! FocusLost * VimadeFadeActive
autocmd! FocusGained * VimadeUnfadeActive
let g:vimade = {}
let g:vimade.fadelevel = 0.3

" easymotion
nmap s <Plug>(easymotion-s)

" vim session
let g:workspace_persist_undo_history = 0
let g:workspace_autosave_always = 1

" fzf settings
let g:fzf_command_prefix = 'Fzf'

" maps
nnoremap <Leader>a :FzfRg<CR>
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Leader>c :let @* = expand("%")<CR>
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <leader>f :FzfBLines<CR>
nnoremap <c-p> :FzfFiles<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l
map <c-k> {zz
map <c-j> }zz
map <c-d> <c-d>zz
map <c-u> <c-u>zz
map <silent> <c-q> :wq<CR>
map j jzz
map k kzz
map <silent> <tab> :bnext<CR>
map <silent> <s-tab> :bprev<CR>
map <silent> <leader><tab> :e#<CR>
vnoremap <c-J> :m '>+1<CR>gv=gv
vnoremap <c-K> :m '<-2<CR>gv=gv

