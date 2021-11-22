source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/airline.vim

set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

let mapleader=","

" set termguicolors
" colorscheme monokai_pro 
" let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
colorscheme sonokai 
" hi Normal guibg=NONE ctermbg=NONE

set nobackup
set nowritebackup

set updatetime=300

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" : "<TAB>"

inoremap <C-l> <Esc>:call unicoder#start(1)<CR>

tnoremap <Esc> <C-\><C-n>
