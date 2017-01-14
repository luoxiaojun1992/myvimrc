call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Vim Go
Plug 'fatih/vim-go'

" Ag
Plug 'rking/ag.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'php-vim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' }

Plug 'Shougo/neocomplete.vim'

Plug 'airblade/vim-gitgutter'

let g:airline#extensions#tabline#enabled = 1
let g:neocomplete#enable_at_startup = 1

set encoding=utf8

" Add plugins to &runtimepath
call plug#end()

set nu
