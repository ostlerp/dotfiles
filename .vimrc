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

Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'gruvbox-community/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
Plug 'djoshea/vim-autoread'
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
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'voldikss/vim-floaterm'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'jparise/vim-graphql'
Plug 'neovim/nvim-lspconfig'

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
set undodir=~/.vim/undodir
set wildmenu
set cursorline
set shiftround
set path=.,,**

syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

set statusline=
set statusline+=%f
set statusline+=%m
set statusline+=%y

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

" easymotion
nmap s <Plug>(easymotion-s)
map <Leader>+ <Plug>(easymotion-prefix)

" fzf settings
let g:fzf_command_prefix = 'Fzf'

" fzf maps
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <c-p> :FzfGFiles<CR>

" coc maps
map <silent> <leader>gd <Plug>(coc-definition)
map <silent> <leader>gr <Plug>(coc-references)
" nnoremap <silent> <leader>gc <Plug>(coc-rename)
nnoremap <silent> <leader>gg :call <SID>show_documentation()<CR>
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nnoremap <leader>d :CocRestart<CR><CR>
nnoremap <leader>S :CocList --normal gstatus<CR>
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-tsserver', 'coc-yaml', 'coc-sh', 'coc-eslint', 'coc-prettier', 'coc-phpactor', 'coc-spell-checker', 'coc-lua']
nnoremap <silent><leader>F :CocCommand prettier.formatFile<CR>

" nvim lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = [ 'exact', 'substring', 'fuzzy' ]
let g:completion_matching_smart_case = 1
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.graphql.setup{}

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
nnoremap <silent> <Leader>C :OpenGithubFile<CR>
nnoremap <Leader>x :bp\|bd #<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :%!jq .<CR>
nnoremap <Leader>\ :cclose<CR>
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
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
nnoremap E $
xnoremap E $
nnoremap B ^
xnoremap B ^

autocmd FileType php setlocal iskeyword+=$

autocmd FileType php xnoremap <buffer> <Leader>ok "ayOerror_log('<C-R>=expand("%:t")<CR> - <C-R>a: ' . var_export(<C-R>a, true));<Esc>
autocmd FileType php xnoremap <buffer> <Leader>oj "ayoerror_log('<C-R>=expand("%:t")<CR> - <C-R>a: ' . var_export(<C-R>a, true));<Esc>
autocmd FileType php nnoremap <buffer> <Leader>ok "ayiwOerror_log('<C-R>=expand("%:t")<CR> - <C-R>a: ' . var_export(<C-R>a, true));<Esc>
autocmd FileType php nnoremap <buffer> <Leader>oj "ayiwoerror_log('<C-R>=expand("%:t")<CR> - <C-R>a: ' . var_export(<C-R>a, true));<Esc>

autocmd FileType javascript,typescript,typescriptreact xnoremap <buffer> <Leader>ok "ayOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>
autocmd FileType javascript,typescript,typescriptreact xnoremap <buffer> <Leader>oj "ayoconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>
autocmd FileType javascript,typescript,typescriptreact nnoremap <buffer> <Leader>ok "ayiwOconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>
autocmd FileType javascript,typescript,typescriptreact nnoremap <buffer> <Leader>oj "ayiwoconsole.log('<C-R>=expand("%t")<CR> - <C-R>a:', <C-R>a);<Esc>

