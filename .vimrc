if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ajmwagar/vim-deus'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'webdevel/tabulous'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'

call plug#end()

colors deus
set number

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set statusline+=%#warningmsg#
set statusline+=%*
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
