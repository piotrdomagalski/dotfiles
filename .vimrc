runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

let g:Powerline_symbols = 'fancy'

let g:clang_use_library = 1

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

set nocompatible
filetype plugin indent on
syntax on
set number

"set undofile

" Solarized theme
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
if v:version >= 702
	" Lines longer than 80 columns.
	" au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)

	" Whitespace at the end of a line. This little dance suppresses
	" whitespace that has just been typed.
	au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
	au InsertEnter * call matchdelete(w:m1)
	au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
	au InsertLeave * call matchdelete(w:m2)
	au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
else
	au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
	au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
	au InsertLeave * syntax match WhitespaceEOL /\s\+$/
endif

set laststatus=2
set nowrap
set modeline
set tw=100

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	endif
endif

nnoremap <F5> :GundoToggle<CR>
