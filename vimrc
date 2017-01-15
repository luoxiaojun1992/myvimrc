call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" NERDCommenter
Plug 'scrooloose/nerdcommenter'

" phpcd
Plug 'phpvim/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" vim-go
Plug 'fatih/vim-go'

" fugitive
Plug 'tpope/vim-fugitive'

" gitgutter
Plug 'airblade/vim-gitgutter'

" snippet engine
" ultisnips
Plug 'sirver/ultisnips'

" snippets
Plug 'honza/vim-snippets'

" synastic
Plug 'scrooloose/syntastic'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" Surround
Plug 'tpope/vim-surround'

" Ag
Plug 'rking/ag.vim'

" fzf
Plug 'lvht/fzf-mru' | Plug 'junegunn/fzf'

" Emmet
Plug 'mattn/emmet-vim'

" Tagbar
Plug 'majutsushi/tagbar'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vawa Auto Highlight Word
"Plug 'vawa.vim'

" Debug
Plug 'joonty/vdebug'

call plug#end()

" settings
syntax on
set noswapfile
set number
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set wrap
set fileformat=unix
set encoding=utf-8
set t_Co=256
set laststatus=2
set autoread
set clipboard=unnamed
set hlsearch
"set paste
set listchars=tab:>-,trail:-,eol:<,nbsp:%,extends:>,precedes:<,space:-

" set file as html
func! InitHtml()
    call SetIndentSpaces(2)
endfunc

" add CodeIgniter snippets
func! InitCI()
    UltiSnipsAddFiletypes php.codeigniter
    doautocmd FileType
endfunc

" set indent spaces by num
func! SetIndentSpaces(num)
    let &l:tabstop = a:num
    let &l:shiftwidth = a:num
    let &l:softtabstop = a:num
endfunc

" clean search
func! CleanSearch()
    let @/ = ''
    echo 'clean search'
endfunc

" accoding filetype to set spaces
autocmd FileType python call SetIndentSpaces(2)
autocmd FileType html call SetIndentSpaces(2)
autocmd BufRead,BufnewFile *.blade.php call SetIndentSpaces(2)

" map func
noremap <Leader>ici :call InitCI()<CR>
noremap <Leader>ih :call InitHtml()<CR>
noremap <silent><Leader>is :call CleanSearch()<CR>
noremap <Leader>sit :call SetIndentSpaces(2)<CR>
noremap <Leader>sif :call SetIndentSpaces(4)<CR>

" set OmniComplete key
"inoremap <C-Space> <C-x><C-o>
"imap <Nul> <C-Space>

" auto highlight occurance word
"autocmd CursorMoved * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"autocmd CursorMovedi * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'

" set vawa
"let g:vawahl="ctermbg=yellow ctermfg=gray guifg=red guibg=black gui=bold"

" load NERDTree
nnoremap <silent><Leader>e :NERDTreeToggle<CR>   
nnoremap <silent><Leader>f :NERDTreeFind<CR>   

" set Fugitive
nmap <silent><Leader>gb :Gblame<CR>
nmap <silent><Leader>gd :Gdiff<CR>
nmap <silent><Leader>gs :Gstatus<CR>

" load phpcd
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
autocmd CompleteDone * pclose

" load Tagbar
nnoremap <silent><Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 1

" set FZF
noremap <silent><C-p> :FZF<CR> 
noremap <silent><C-x><C-p> :FZFMru<CR>
let $FZF_DEFAULT_COMMAND = 'ag -aflU --hidden -p ~/.agignore'

" set syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_php_checkers = ['php']

" set air-line
" set air-line default enabled
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" set EasyMotion
" Gif config
let g:EasyMotion_smartcase = 1
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)
nmap <Leader>l <Plug>(easymotion-lineforward)
" nmap <Leader>h <Plug>(easymotion-linebackward)

" set UltiSnips
let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsListSnippets = '<C-a>'
let g:UltiSnipsJumpForwardTrigger = '<C-f>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnipsUsePythonVersion = 2

" set Emmet
let g:user_emmet_leader_key='<C-k>'
let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'html' : {
\    'extends' : 'html',
\  },
\}

" set noautoindent

