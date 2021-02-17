" spell-checker: disable
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" Plug 'sheerun/vim-polyglot'
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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'TaDaa/vimade'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'joonty/vdebug'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

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
set number
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
" set tabstop=2
set undodir=~/.vim/undodir
set wildmenu
set cursorline
set shiftround

syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

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
let g:floaterm_opener = 'edit'

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
nnoremap <silent> <leader>gc <Plug>(coc-rename)
nnoremap <silent> <leader>gg :call <SID>show_documentation()<CR>
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nnoremap <leader>d :CocRestart<CR><CR>
nnoremap <leader>S :CocList --normal gstatus<CR>
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-tsserver', 'coc-yaml', 'coc-sh', 'coc-eslint', 'coc-prettier', 'coc-phpactor', 'coc-spell-checker']
nnoremap <silent><leader>F :CocCommand prettier.formatFile<CR>

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
" nnoremap <Leader>a ggVG
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Leader>c :let @* = expand("%")<CR>
nnoremap <silent> <Leader>C :OpenGithub<CR>
nnoremap <Leader>x :bp\|bd #<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :%!jq .<CR>
nnoremap <Leader><Leader> :cclose<CR>
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
nnoremap <Leader>ok "ayiwOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>
nnoremap <Leader>oj "ayiwoconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
noremap <Leader>l <c-w>l
nnoremap <silent> <c-q> :wq<CR>
nnoremap j jzz
nnoremap k kzz
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprev<CR>
nnoremap <silent> <leader><tab> :e#<CR>
nnoremap + <C-w>>
nnoremap _ <C-w><
nnoremap E $
xnoremap E $
nnoremap B ^
xnoremap B ^

xnoremap <Leader>ok "ayOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>
xnoremap <Leader>oj "ayoconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>

nnoremap <C-space> <Esc>
vnoremap <C-space> <Esc>gV
onoremap <C-space> <Esc>
cnoremap <C-space> <C-C><Esc>
inoremap <C-space> <Esc>`^
