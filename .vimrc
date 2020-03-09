map <Space> <Leader>
map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l
map <c-k> {zz
map <c-j> }zz
map j jzz
map k kzz

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'webdevel/tabulous'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'myusuf3/numbers.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'romainl/vim-cool'

call plug#end()

syntax on

colorscheme gruvbox
set number

set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set modifiable

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:peekaboo_window = 'vert bo new45'

set wildignore+=*/temp/*,*/dist/*,*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

command! E Explore

map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
