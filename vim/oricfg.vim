""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlight
syntax on

" Encoding dectection
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowb
set noswapfile

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Search
set incsearch
set smartcase
set hlsearch

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Editor settings
set history=1000
set tm=1500                       " leader key timeout
set nofoldenable                  " disable folding
set confirm                       " prompt when existing from an unsaved file
set backspace=indent,eol,start    " more powerful backspacing
set t_Co=256                      " explicitly tell vim that the terminal has 256 colors
set mouse=a                       " use mouse in all modes
set report=0                      " always report number of lines changed
set nowrap                        " don't wrap lines
set scrolloff=3                   " 3 lines above/below cursor when scrolling
set number                        " show line numbers
set showmatch                     " show matching bracket
set showcmd                       " show typed command in status bar
set title                         " show file in titlebar
set laststatus=2                  " use 2 lines for the status bar
set matchtime=2                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>               " specially for html
set lazyredraw                    " don't redraw while executing macros
set magic                         " for regular expressions turn magic on
set foldcolumn=1                  " add a bit extra margin to the left
set wildmenu                      " wildmenu
set wildmode=longest,list,full    " tab complete files up to longest unambiguous prefix
set so=7                          " set 7 lines to the cursor - when moving vertically using j/k
set cc=80                         " color the 80th column
set foldmethod=syntax             " fold by syntax
set updatetime=100
set whichwrap+=<,>,h,l


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set formatoptions+=mM

" Linebreak on 500 characters
set lbr
set textwidth=500

augroup lang_config
    autocmd!
    autocmd FileType ruby,ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
    autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
    autocmd FileType coffee,javascript,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80
    autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
    autocmd BufRead,BufNewFile *.tex setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80 ft=tex
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd FileType mkd setlocal spell textwidth=80
    autocmd FileType gitcommit setlocal spell textwidth=72
    autocmd BufRead,BufNewFile *,lua,*.c,*.py,*.sh,*.pl,*.rb,*.erb 2match Underlined /.\%81v/
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""
func! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ",")
    if count(cc_list, string(col_num)) <= 0
        exe "set cc+=" . col_num
    else
        exe "set cc-=" . col_num
    endif
endfunc

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

func! TabNext()
    if exists('*tabpagenr') && tabpagenr('$') != 1
        normal gt
    else
        exe ":bnext"
    endif
endfunc

func! TabPrev()
    if exists('*tabpagenr') && tabpagenr('$') != 1
        normal gT
    else
        exe ":bprev"
    endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload the buffer upon detecting change
set autoread
autocmd CursorHold,CursorHoldI * silent! checktime

" Clear column highlight theme
highlight clear SignColumn

" Detete trailing whitespace
augroup whitespace
    autocmd!
    autocmd BufWrite *.lua,*.pl,*.py,*.md,*.c,*.cpp
        \ :call DeleteTrailingWS()
augroup END

" Return to last edit position when opening file
augroup last_edit
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \    exe "normal! g`\"" |
        \ endif
augroup END

augroup sourcing
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste
nmap <leader>p :set paste! paste?<CR>

" Toggle number
nmap <leader>nb :set number! number?<CR>

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
nmap <leader>t :tabedit <C-R>=expand("%:p:h") . '/'<CR>

" Toggle hexdump
nmap <leader>hex :%!xxd<CR>
nmap <leader>her :%!xxd -r<CR>

" Movement between tabs or buffers
nnoremap Q :call TabPrev()<CR>
nnoremap W :call TabNext()<CR>

" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>:hi Cursor ctermbg=red guibg=red<CR>

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk

" Force redraw
map <silent> \r :redraw!<CR>

" Command line mode
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    colorscheme molokai
catch
endtry
