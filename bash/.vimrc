" this file was create by ethan chan 2011.10.01
" version 1.0.0.0
"
" edit at 2011.12.06 by 'ethan chan'
" version  : 1.1.0.0
" modified : add map <C-x> <C-v> <C-c> <C-a>
"
"
set tags=tags;

let &termencoding=&encoding

" character set support.
set fileencodings=utf-8,gbk,ucs-bom,cp936

" Set the file format for unix (non-doc).
set fileformats=unix
" set encoding=prc

" set the color scheme.
colorsche desert256
set t_Co=256

" remove annoying about consistency vi mode, avoiding some of the previous
" version and limitations bug.
set nocompatible

" show line number.
set number

" syntax highlighting.
syntax on
syntax enable

" Set the matching mode, similar to when you enter a left parenthesis that
" will match the corresponding right parenthesis.
" Highlight matching brackets.
set showmatch

" In the editing process, the cursor position is displayed in the lower right.
" corner of the status line
set ruler

" Highlight search keywords.
set hlsearch

" Query automatically jump to the first match of the word.
set incsearch

" Highlight matching brackets time (in tenths of a second).
set matchtime=5

" My status line displayed content (including file type and decode).
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" Enhanced mode command-line operation automatically
set wildmenu

" Make the backspace key (backspace) normal processing indent, eol, start,
" etc.
set backspace=2

" Allow backspace and cursor keys across the border row.
set whichwrap+=<,>,h,l

" You can use the mouse anywhere in the buffer (similar office in the
" workspace, double-click the mouse positioning).
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

" By using the: commands Command, told us which line of the file is changed.
set report=0

" Start time is not displayed prompts that aid children in Somalia.
set shortmess=atI

" The window is divided between the blank, easy to read.
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 3 lines to keep the distance the cursor moves to the top and bottom of the
" buffer of.
set scrolloff=3

" C program provides for the automatic indentation.
" set smartindent

" Set the tab for the two spaces.
set tabstop=2 
" Set using two spaces between the lines when the staggered.
set shiftwidth=2 
" Set the number of spaces are automatically deleted 2.
set softtabstop=2

" Automatically switch the current directory to the directory where the
" current file.
set autochdir

" Set Highlight *.pc file ( for proc programming )
" autocmd BufEnter *.pc set filetype=esqlc
" if exists("did_load_filetypes") 
"     finish 
" endif 
" augroup filetypedetect 
"     au! BufRead,BufNewFile *.pc setfiletype proc 
" augroup END 

" Set the file type checking.
filetype plugin on
filetype plugin indent on

" Has prompted the menu after entering letters instant filtering and matching
" i.
set completeopt=longest,menu

" Set the path tags.
set tags+=/usr/include/tags,/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/tags,

" Set TagList start.
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" The file browser with Tlist merger.
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" cscope configure.
" :set cscopequickfix=s-,c-,d-,i-,t-,e-

" MiniBufExplorer configure. 
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" Highlighted with light-colored and underlined the current line.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul


" a.vim Switching between the .h .c file.
nnoremap <silent> <F12> :A<CR>

" Office documents can press F3 grep works under the corresponding function,
" variable.
nnoremap <silent> <F3> :Grep<CR>

" SuperTab configuration.
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" Shortcut keys to switch between the defined window.
map RR <C-W><C-L>
map LL <C-W><C-H>
map DD <C-W><C-J>
map UU <C-W><C-K>


" Ctrl+x Cut command.
" unmap <C-x>
" map <C-x> "+x<CR>
" imap <C-x> <Esc>"+x<CR>i
vmap <C-x> x<CR>i

" Ctrl+c Copy command.
" unmap <C-c>
" map <C-c> "+y<CR>
" imap <C-c> <Esc>"+y<CR>i
vmap <C-c> y<CR>i

" Ctrl+v Paste command (with the block command conflict, not yet enabled).
" unmap <C-v>
" map <C-v> "+gp<CR>
" imap <C-v> <Esc>"+gp<CR>i
" map <C-v> gp<CR>
" imap <C-v> <Esc>gp<CR>i

" Ctrl+z revocation of the order.
" unmap <C-z>
map <C-z> u
imap <C-z> <Esc>ui

" Edit mode Ctrl + o insert a new row.
" unmap <C-o>
" imap <C-o> <Esc>o

" Ctrl+a select all.
map <C-a> ggVG
imap <C-a> <Esc>ggVGi
vmap <C-a> <Esc>ggVGi

" Ctrl+s save file.
" unmap <C-s>
" map <C-s> :w<CR>
" imap <C-s> <Esc>:w<CR>i
" cmap <C-s> :w<CR>




" F5 to compile and run C programs, F6 to compile and run C + + programs.
" Please note, the following code uses will complain in the windows, the need
" to remove. / These two characters.

" C compiler and run
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
exec "cw"
endfunc
" C + + compiler and run
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
exec "cw"
endfunc

" Can be displayed neatly. NFO files.
" set encoding=utf-8
" function! SetFileEncodings(encodings)
"     let b:myfileencodingsbak=&fileencodings
"     let &fileencodings=a:encodings
" endfunction
" function! RestoreFileEncodings()
"     let &fileencodings=b:myfileencodingsbak
"     unlet b:myfileencodingsbak
" endfunction
" 
" au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
" au BufReadPost *.nfo call RestoreFileEncodings()


