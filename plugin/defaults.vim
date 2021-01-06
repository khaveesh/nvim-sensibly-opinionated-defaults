""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     nvim-sensibly-opinionated-defaults - The Courageous Neovim Plugin      "
"     Maintainer: Khaveesh N                                                 "
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
	autocmd TextYankPost * silent lua vim.highlight.on_yank{timeout = 1000, on_visual = false}
augroup END

" }}}


" EditorConfig {{{

set relativenumber          " Enable relative numbering for easy jumps
set mouse=a                 " Enable full mouse support
set scrolloff=3             " Set 3 lines to the cursor when moving vertically
set list                    " Indicate tab stops
set hidden                  " Quick switch buffer without worries
set ignorecase smartcase    " Better search
set splitbelow splitright   " More natural split positions
set shortmess+=Ic           " Suppress startup & completion messages
set confirm
set linebreak breakindent   " Wrap a long line into multiple lines with indent
let &showbreak = '↳ '       " Indicate line breaks

set inccommand=nosplit      " Live Preview of substitute (Neovim only)

let g:tex_flavor = 'latex'  " Always use LaTeX flavour instead of plaintex

" }}}
