:set nocp
:set number
:set expandtab ts=4 sw=4 ai
:set clipboard^=unnamed
:set backspace=indent,eol,start

:syntax on

call plug#begin('~/.vim/plugged')

" nerdtree
Plug 'preservim/nerdtree'

nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

Plug 'Valloric/YouCompleteMe'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" ale plugin
Plug 'dense-analysis/ale'
let g:ale_set_highlights = 0

Plug 'scrooloose/nerdtree'

call plug#end()
