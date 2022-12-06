source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/airline.vim

set showmatch               " show matching braces
set ignorecase              " case insensitive
set hlsearch                " highlight search 
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " add line numbers relative to current line
set wildmode=longest,list   " get bash-like tab completions
set wildignore+=*/bin/*,*.so,*.swp,*.zip,*.o,*.d " ignore binary file types
set wildignore+=*.aux,*.fdb_latexmk,*.fls,*.log,*.synctex.gz,*.xopp~,*.xopp,*.pdf,*.dvi " ignore latex outputs
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

filetype plugin indent on
let g:rustfmt_autosave = 1  " run rustfmt on save

" Syntax-based folding
set foldmethod=syntax
set nofoldenable

" comma as leader key
let mapleader=","
let maplocalleader=","

" color scheme
set termguicolors
colorscheme molokai 
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 0

" No swp files
set nobackup
set nowritebackup

set updatetime=300

" CoC jumping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" <Tab>: completion
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-N>" :
    \ init#check_back_space() ? "\<Tab>" :
    \ coc#refresh()
" <S-Tab>: completion back
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
" <CR>: confirm completion, or insert <CR>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

function! init#check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

let g:UltiSnipsExpandTrigger="<C-SPC>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

inoremap <C-l> <Esc>:call unicoder#start(1)<CR>

tnoremap <Esc> <C-\><C-n>

filetype plugin indent on

let g:sneak#label = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

nmap <leader>rn <Plug>(coc-rename)

lua <<EOF
-- DAP configuration
local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/rayhaan/.local/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {  
          { 
             text = '-enable-pretty-printing',
             description =  'enable pretty printing',
             ignoreFailures = false 
          },
        },
    },
    -- {
    --     name = 'Attach to gdbserver :1234',
    --     type = 'cppdbg',
    --     request = 'launch',
    --     MIMode = 'gdb',
    --     miDebuggerServerAddress = 'localhost:1234',
    --     miDebuggerPath = '/usr/bin/gdb',
    --     cwd = '${workspaceFolder}',
    --     program = function()
    --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --     end,
    -- },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup()

EOF

nnoremap <silent> <Leader>c <Cmd>lua require'dap'.run_to_cursor()<CR>
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
