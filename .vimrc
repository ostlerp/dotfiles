call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
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
Plug 'rafaqz/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-css-color'
Plug 'liuchengxu/vim-which-key'

" tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

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
set laststatus=2
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
set mouse=nv
set nobackup
set noruler
set noswapfile
set nowrap
set number
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undodir
set wildmenu

syntax on
colorscheme gruvbox

set statusline=
set statusline+=%f
set statusline+=%m

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
map <Leader>+ <Plug>(easymotion-prefix)


" vim session
let g:workspace_persist_undo_history = 0
let g:workspace_autosave_always = 1

" fzf settings
let g:fzf_command_prefix = 'Fzf'

" fzf maps
nnoremap <Leader>a :FzfRg<CR>
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <leader>f :FzfBLines<CR>
nnoremap <c-p> :FzfGFiles<CR>

" coc maps
map <silent> <leader>gd <Plug>(coc-definition)
map <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>gg :call <SID>show_documentation()<CR>

" tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" which key
nnoremap <silent> <leader> :WhichKey '\'<CR>

" maps
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Leader>c :let @* = expand("%")<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader> :cclose<CR>
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
nnoremap <Leader>o "ayiwOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a)<Esc>
map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l
map <c-j> <c-d>zz
map <c-k> <c-u>zz
map <silent> <c-q> :wq<CR>
map j jzz
map k kzz
map <silent> <tab> :bnext<CR>
map <silent> <s-tab> :bprev<CR>
map <silent> <leader><tab> :e#<CR>

vnoremap <c-J> :m '>+1<CR>gv=gv
vnoremap <c-K> :m '<-2<CR>gv=gv
xnoremap <Leader>o "ayOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a)<Esc>

tnoremap <Esc> <C-\><C-n>
tnoremap <Leader>x :bd!<CR>
