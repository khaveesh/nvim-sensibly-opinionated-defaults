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

  " Don't auto comment lines on <CR> or 'o/O'
  autocmd Syntax * setlocal formatoptions-=ro

  " Restore last file position
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$")
        \   && &ft !~# 'commit' && &diff == 0
        \ |   exe "normal! g`\""
        \ | endif

  " Highlight yanked region (Neovim only)
  autocmd TextYankPost * silent lua vim.highlight.on_yank()

  " Don't show line breaks for man pages
  autocmd FileType man set showbreak&
augroup END

" }}}

" EditorConfig {{{

set relativenumber          " Enable relative numbering for easy jumps
set splitbelow splitright   " More natural split positions
set scrolloff=3             " Set 3 lines to the cursor when moving vertically
set ignorecase smartcase    " Better search
set mouse=a                 " Enable full mouse support
set list                    " Indicate tab stops
set confirm                 " Confirm directly instead of retyping
set diffopt+=foldcolumn:0   " Disable extra column for folds
set wildmode=longest,full   " Bash-style completion
set shortmess+=Ic           " Suppress start-up & completion messages
set title                   " Change terminal title from vim

set linebreak breakindent   " Soft wrap a long line with indent
let &showbreak = '⮑  '      " Indicator for line breaks

let g:tex_flavor = 'latex'  " Always use LaTeX flavour instead of plaintex

" }}}

" vim: foldmethod=marker
