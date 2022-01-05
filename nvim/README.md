## Neovim Configuration Files

Clone this repository into `~/.config/nvim` and in nvim, run `:PlugInstall` to install plugins
from `vim-plug/plugins.vim`.

Coc requires nodejs and coqtail requires python 3.6.0+ and pynvim. Also, for C++ language support
install ccls and generate a compile_commands.json. The easiest way to do this is with the `compiledb`
python utility.
