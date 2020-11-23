augroup defaults
	autocmd!

	" Restore last file position
	autocmd BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' && &diff == 0
				\ |   exe "normal! g`\""
				\ | endif

	" Highlight yanked region
	autocmd TextYankPost * silent lua vim.highlight.on_yank{higroup = 'IncSearch', timeout = 1000}
augroup END


" Terminal Config

" 24-Bit Truecolor
set termguicolors


" EditorConfig

" Relative number for easy jumps
set relativenumber
" Don't autocomment lines on <CR> or 'o/O'
set formatoptions-=ro
" Set 3 lines to the cursor - when moving vertically using j/k
set scrolloff=3
" Indicate that tab stops are used instead of spaces
set list
" Better search
set ignorecase smartcase
" More natural split opening
set splitbelow splitright
" Quick switch buffer without worries
set hidden
" Wrap a long line into multiple lines with indent
set linebreak breakindent
let &showbreak = '↳ '

" Live Preview of substitute
set inccommand=nosplit
