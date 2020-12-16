""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     nvim-sensibly-opinionated-defaults - The Courageous Neovim Plugin
"     Maintainer: Khaveesh N
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:loaded_defaults')
	finish
endif

let g:loaded_defaults = 1


" Autocmds {{{

augroup defaults
	autocmd!

	" Don't autocomment lines on <CR> or 'o/O'
	autocmd Syntax * setlocal formatoptions-=ro

	" Restore last file position
	autocmd BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' && &diff == 0
				\ |   exe "normal! g`\""
				\ | endif

	" Highlight yanked region (Neovim only)
	autocmd TextYankPost * silent lua vim.highlight.on_yank{higroup = 'IncSearch', timeout = 1000}
augroup END

" }}}


" Terminal Config {{{

" 24-Bit Truecolor
set termguicolors

" }}}


" EditorConfig {{{

" Enable full mouse support
set mouse=a
" Relative number for easy jumps
set relativenumber
" Set 3 lines to the cursor - when moving vertically using j/k
set scrolloff=3
" Suppress startup & completion messages
set shortmess+=Ic
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

" Live Preview of substitute (Neovim only)
set inccommand=nosplit

" Always use LaTeX flavour instead of plaintex
let g:tex_flavor = 'latex'

" }}}
