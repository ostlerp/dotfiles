call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'gruvbox-community/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
Plug 'djoshea/vim-autoread'
Plug 'thaerkh/vim-workspace'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'jremmen/vim-ripgrep'
Plug 'ap/vim-buftabline'
Plug 'TaDaa/vimade'
" Plug 'rafaqz/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-css-color'
Plug 'liuchengxu/vim-which-key'
Plug 'k0kubun/vim-open-github'
Plug 'voldikss/vim-floaterm'

" tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'

call plug#end()

" configs
set autoindent
set clipboard=unnamedplus
set expandtab
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
set number relativenumber
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undodir
set wildmenu
set cursorline

syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set statusline=
set statusline+=%f
set statusline+=%m

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" buftabline settings
let g:buftabline_numbers = 1

" floaterm
map <silent> - :FloatermNew ranger<CR>
tnoremap <silent> <C-l> <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <C-h> <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <Leader>q <C-\><C-n>:FloatermKill<CR>
let g:floaterm_keymap_new    = '<Leader>n'
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_height = 0.75
let g:floaterm_width = 0.75

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
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <c-p> :FzfGFiles<CR>

" coc maps
map <silent> <leader>gd <Plug>(coc-definition)
map <silent> <leader>gr <Plug>(coc-references)
map <silent> <leader>gc <Plug>(coc-rename)
nnoremap <silent> <leader>gg :call <SID>show_documentation()<CR>
map <leader>d :CocRestart<CR><CR>

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
nnoremap <Leader>a ggVG
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Leader>c :let @* = expand("%")<CR>
nnoremap <silent> <Leader>C :OpenGithub<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>f :%!jq .<CR>
nnoremap <Leader><Leader> :cclose<CR>
nnoremap <Bar> :close<CR>
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
nnoremap <Leader>ok "ayiwOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a)<Esc>
nnoremap <Leader>oj "ayiwoconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a)<Esc>
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l
nnoremap <silent> <c-q> :wq<CR>
nnoremap j jzz
nnoremap k kzz
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprev<CR>
nnoremap <silent> <leader><tab> :e#<CR>
nnoremap + <C-w>>
nnoremap _ <C-w><

xnoremap <Leader>o "ayOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a)<Esc>

