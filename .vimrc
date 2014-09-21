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

set undofile
set undodir =~/.vim/.vimundo/

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

" q!            Abort macro recording without changing the current one.
function! s:AbortMacroRecording()
    " We don't know which register is being recorded, so save them all and find
    " the one by comparing all values.
    let l:registers = split('abcdefghijklmnopqrstuvwxyz', '\zs')
    let l:savedRegisters = map(copy(l:registers), 'getreg(v:val)')

    " Abort macro recording.
    normal! q

    for l:idx in range(len(l:registers))
        let l:reg = l:registers[l:idx]
        let l:contents = l:savedRegisters[l:idx]
        if getreg(l:reg) !=# l:contents
            call setreg(l:reg, l:contents)
            echo printf('Aborted recording into register %s; macro is: %s', l:reg, strtrans(l:contents))
            return
        endif
    endfor

    echomsg "Couldn't detect recorded register"
endfunction
nnoremap <silent> q! :<C-u>call <SID>AbortMacroRecording()<CR>
