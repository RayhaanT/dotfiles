call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " VimTex
     Plug 'lervag/vimtex'
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
    " Coc autocompletion and more
    Plug 'neoclide/coc.nvim', {'branch': 'release'}    
    " Coq interpreter
    Plug 'whonore/Coqtail'
    " Monokai pro theme
    Plug 'phanviet/vim-monokai-pro'
    " Monokai pro alternative theme
    Plug 'sainnhe/sonokai'
    " Git status line symbols
    Plug 'airblade/vim-gitgutter'
    " Git integration in vim
    Plug 'tpope/vim-fugitive'
    " Insert unicode from latex commands using <C-l>
    Plug 'joom/latex-unicoder.vim'
    " Racket plugin
    Plug 'wlangstroth/vim-racket'
    " Fuzzy file search with <C-p>
    Plug 'kien/ctrlp.vim'
    " fzf fuzzy search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " fzf vim integration
    Plug 'junegunn/fzf.vim'
    " Rust
    Plug 'rust-lang/rust.vim'
    Plug 'atelierbram/Base2Tone-vim'
    " Better seeking with f
    Plug 'justinmk/vim-sneak'
    " Visual debugging
    Plug 'puremourning/vimspector'
    " Haskell
    Plug 'neovimhaskell/haskell-vim'
    " Racket REPL support
    Plug 'Olical/conjure'
    " Diffview
    Plug 'sindrets/diffview.nvim'
    " Lua dependency
    Plug 'nvim-lua/plenary.nvim'
    " Window resizing
    Plug 'simeji/winresizer'
call plug#end()

