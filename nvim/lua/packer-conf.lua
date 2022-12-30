-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Better Syntax Support
    use 'sheerun/vim-polyglot'
    -- Auto pairs for '(' '[' '{'
    use 'jiangmiao/auto-pairs'
    -- VimTex
    use 'lervag/vimtex'
    -- Snippets are separated from the engine. Add this if you want them:
    use 'honza/vim-snippets'
    -- Molokai Theme
    use 'tomasr/molokai'
    -- Gruvbox Theme
    use 'morhetz/gruvbox'
    -- Status line and tabline
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    -- Coc autocompletion and more
    use {'neoclide/coc.nvim', branch = 'release'}
    -- Coq interpreter
    use 'whonore/Coqtail'
    -- Monokai pro theme
    use 'phanviet/vim-monokai-pro'
    -- Monokai pro alternative theme
    use 'sainnhe/sonokai'
    -- Git status line symbols
    use 'airblade/vim-gitgutter'
    -- Git integration in vim
    use 'tpope/vim-fugitive'
    -- Insert unicode from latex commands using <C-l>
    use 'joom/latex-unicoder.vim'
    -- Racket usein
    use 'wlangstroth/vim-racket'
    -- Fuzzy file search with <C-p>
    use 'kien/ctrlp.vim'
    -- fzf fuzzy search
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    -- fzf vim integration
    use { 'junegunn/fzf.vim' }
    -- Rust
    use 'rust-lang/rust.vim'
    -- Two tone theme pack
    use 'atelierbram/Base2Tone-vim'
    -- Better seeking with f
    use 'justinmk/vim-sneak'
    -- Visual debugging
    use 'puremourning/vimspector'
    -- Haskell
    use 'neovimhaskell/haskell-vim'
    -- Racket REPL support
    use 'Olical/conjure'
    -- Diffview
    use 'sindrets/diffview.nvim'
    -- Lua dependency
    use 'nvim-lua/plenary.nvim'
    -- Window resizing
    use 'simeji/winresizer'
    -- Commenting
    use 'tomtom/tcomment_vim'
    -- -- Better highlighting for C and family
    use 'jackguo380/vim-lsp-cxx-highlight'
    -- Replace brackets and stuff
    use 'tpope/vim-surround'
    -- Debugger interface
    use 'mfussenegger/nvim-dap'
    -- UI for debugger
    use 'rcarriga/nvim-dap-ui'
end)
