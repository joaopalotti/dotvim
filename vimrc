
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Many of the commands here were brought from:
"  1. http://amix.dk/vim/vimrc.html "
"  2. http://dougblack.io/words/a-good-vimrc.htm
"  3. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PathOGen initial commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()                      " use pathogen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" <leader> is mapped to ,
let mapleader=","       " leader is comma

"" Sets how many lines of history VIM has to remember
 set history=700

"" Enable filetype plugins
filetype plugin on
filetype indent on

"" Set to auto read when a file is changed from the outside
"set autoread

"" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

"" Height of the command bar
"set cmdheight=2


"" How many tenths of a second to blink when matching brackets
set mat=2

"" No annoying sound on errors
"set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500
" Use visual bell instead of beeping when doing something wrong
"set visualbell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts, UI Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Enable syntax highlighting
syntax enable

colorscheme desert
"colorscheme badwolf 
set background=dark

"" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"" Use Unix as the standard file type
set ffs=unix,dos,mac

"" show command in bottom bar
"set showcmd 

"" highlight current line
"set cursorline         

""visual autocomplete for command menu. (when press <TAB> for a command>
"set wildmode=longest,list 
set wildmenu   " This one is prettier than wildmode

"" Show matching brackets when text indicator is over them
set showmatch

" Shows the filename in my terminal tab
set title 

" Shows line numbers
set number 

" Enables mouse for all modes
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nowb
"set noswapfile
"set nobackup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab, spacing and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use spaces instead of tabs
set expandtab

"" Be smart when using tabs ;)
set smarttab

"" number of spaces in tab when editing
set softtabstop=4   

"" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""
"" Visual mode pressing * or # searches for the current selection
"" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""

"Ignore case when searching
set ignorecase

"" When searching try to be smart about cases 
set smartcase

"" Highlight search results
set hlsearch

"" Makes search act like search in modern browsers
set incsearch

"" For regular expressions turn magic on
set magic

" turn off search highlight
nnoremap <space><space> :nohlsearch<CR>

""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""
"" Always show the status line
set laststatus=2

"" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Necessary to run LanguageTools
set nocompatible

let spell_auto_type="all"

"" English
:nmap <F6> :setlocal spell! spelllang=en<cr>

"" Brazilian Portuguese
:nmap <F7> :setlocal spell! spelllang=pt<cr>

"" Grammar check for English
:nmap <F8> :LanguageToolCheck <cr>

"TODO: CHECK
" let g:tex_flavor='latex' "if uncommented the highlighed errors from spell check are not shown
let g:languagetool_jar='$HOME/.vim/languagetool/LanguageTool-2.8/languagetool-commandline.jar'

"Automatically spell checks tex files when opened
autocmd BufRead,BufNewFile *.tex setlocal spell

""""""""""""""""""""""""""""""
" => TMUX
"""""""""""""""""""""""""""""""
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

""""""""""""""""""""""""""""""
" => GUndo
"""""""""""""""""""""""""""""""
""TODO: install
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
"let g:gundo_right = 1

""""""""""""""""""""""""""""""
" => Python Syntax
"""""""""""""""""""""""""""""""

" Syntastic
" --------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['mypy', 'flake8']

" Pyflakes
" --------
let g:pyflakes_use_quickfix = 0

""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""
" Ok, I hate when I start to edit a file without root permission...so, this is
" a solution:
cmap w!! w !sudo tee % >/dev/null

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


