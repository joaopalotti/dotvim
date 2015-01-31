"Ok, I hate when I start to edit a file without root permission...so, this is
"a solution:
cmap w!! w !sudo tee % >/dev/null

"It is necessary to have the toogle puglin installed first:
"http://www.vim.org/scripts/script.php?script_id=1676
nmap ,t :ToggleWord<CR> 

call pathogen#infect() 
let g:languagetool_jar=$HOME . '/languagetool/dist/LanguageTool.jar'

"set background=dark " eu uso o terminal com fundo escuro
set encoding=utf8
set nocompatible
set incsearch " procura texto em tempo real, enquanto e' teclado
set ic "Nao diferencia mais/minusc
set magic " usa 'magia' ao procurar texto =)
set backspace=2 " permite apagar qualquer coisa em modo insert
"set textwidth=164 " muda de linha automaticamente ao chegar a esta coluna (164 -> size of forrest screen)
set laststatus=2 " mostra sempre a statusbar com o nome do ficheiro
set ruler " mostra a linha e coluna na statusbar
set title " mostra o nome do ficheiro no titulo do terminal
set smarttab "Tabulacao inteligente
set smartindent
set autoindent
set expandtab "Tab vira espaco
set ts=4 " Tab = 2 brancos
set shiftwidth=4 "Quando o autoindent faz um tab, ele é do tamanho de 4
set softtabstop=4 "Tecla Backspace volta 4 espaços quando estiver numa identação
set sm " mostra o ultimo par de parenteses fechados
set wildmode=longest,list " mostra completacoes ao usar o TAB
set showmode
set showcmd " mostra comando incomletos (marcar caracter, etc)
set shortmess=atI " mensagens abreviadas
set number " mostra numeros de linhas
set mouse=a
set nobackup

set encoding=utf8
" English
:nmap <F6> :setlocal spell! spelllang=en<cr>
" Brazilian Portuguese
:nmap <F7> :setlocal spell! spelllang=pt<cr>

:nmap <F8> :LanguageToolCheck <cr>

syntax on " activa as cores para varios tipos de ficheiros
filetype plugin on "Auto completar Crtl-X Crtl-o
" **************************************************************************
"   
"                  Fechamento automático para parênteses
"     
"**************************************************************************
"         imap ( ()<esc>i
"         inoremap ( ()<esc>i
"         inoremap { {<Char-13><Char-13>}<esc>i
"         inoremap { {}<esc>i
"         inoremap [ []<esc>i
"         inoremap " ""<esc>i

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'



highlight BadWhitespace ctermbg=red guibg=red

if has("autocmd")
    autocmd FileType c,cpp set cindent
    autocmd FileType c,cpp syntax match BadWhitespace /\s\+$/
    autocmd FileType c,cpp set shiftwidth=8 tabstop=8 noexpandtab
    autocmd FileType c,cpp set softtabstop=8 smartindent
endif " has("autocmd")


"BEGIN_DEVASSISTANT_1
"Setting value devassistant to 0 will use your existing .vimrc file
"Setting value devassistant to 1 will use the vimrc defined by the devassistant feature

let devassistant=0
if devassistant==1
 :source /usr/share/devassistant/files/snippets/vim/vimrc
endif
"END_DEVASSISTANT_1
