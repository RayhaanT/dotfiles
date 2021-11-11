call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " VimTex
"     Plug 'lervag/vimtex'
    " Track the engine.
    "    Plug 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'
    " Molokai Theme
    Plug 'tomasr/molokai'
    " Gruvbox Theme
    Plug 'morhetz/gruvbox'
    " Airline status
    Plug 'vim-airline/vim-airline' 
    " Airline themes
    Plug 'vim-airline/vim-airline-themes'
    " Deoplete autocompletion
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Coc autocompletion and more
    Plug 'neoclide/coc.nvim', {'branch': 'release'}    
    Plug 'whonore/Coqtail'
call plug#end()

