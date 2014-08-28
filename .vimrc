execute pathogen#infect()
syntax on
filetype plugin indent on
set cindent
set tabstop=4
set shiftwidth=4

set t_Co=256 "256 color mode
set background=dark "Set the background to dark
colorscheme base16-railscasts "Use the railscasts color scheme

set nu "Set line numbers

"Set the line number background to correct color
highlight LineNr ctermbg=0x232323

"Do not highlight a matching parentheses automatically
let loaded_matchparen = 1


" ****** Leader Remaps ****** "
let mapleader = "\<Space>" "Set the leader to spacebar
"Set <Leader> + w to save a file
nnoremap<Leader>w :w<CR>
"Set <Leader> + f to freeze vim and go back to terminal
nnoremap<Leader>f <C-z>
"Enter line selection with <Leader><Leader>
nmap <Leader><Leader> V
