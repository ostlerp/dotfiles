call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'valloric/youcompleteme'
Plug 'webdevel/tabulous'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
Plug 'djoshea/vim-autoread'
Plug 'thaerkh/vim-workspace'
Plug 'machakann/vim-highlightedyank'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-startify'
Plug 'jremmen/vim-ripgrep'
Plug 'ap/vim-buftabline'
Plug 'TaDaa/vimade'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/limelight.vim'

" tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" configs
set number relativenumber
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set incsearch
set ignorecase
set smartcase
set inccommand=nosplit
set nowrap
set nobackup
set noswapfile
set noundofile
set clipboard=unnamedplus
set splitbelow
set splitright
set hidden
set laststatus=0

syntax on
colorscheme gruvbox

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" buftabline settings
let g:buftabline_numbers = 1

" ctrlp settings
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ranger settings
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
map - :Ranger<CR>

" vimade
autocmd! FocusLost * VimadeFadeActive
autocmd! FocusGained * VimadeUnfadeActive
let g:vimade = {}
let g:vimade.fadelevel = 0.3

" limelight
autocmd VimEnter * Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_priority = -1

" easymotion
nmap s <Plug>(easymotion-s)

" leader commands
nnoremap <Leader>a :Rg<Space>
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>c :let @* = expand("%")<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>g :YcmCompleter GoTo<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" movement
map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l
map <c-k> {zz
map <c-j> }zz
map <c-d> <c-d>zz
map <c-u> <c-u>zz
map j jzz
map k kzz
vnoremap <c-J> :m '>+1<CR>gv=gv
vnoremap <c-K> :m '<-2<CR>gv=gv

