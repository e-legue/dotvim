" launch pathogen plugin.
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

function! IsGCMLEAFED()
  return $GCMLEAF != "/misc/altbuildor/ref/altenv-3.2"
endfunction 

" echo "test"
" echo $GCMLEAF
" echo expand($GCMLEAF)

syntax on                    " syntax highlighing
filetype plugin indent on    " enable loading indent file for filetype

" au BufNewFile,BufRead *.yca set filetype=yaml

set history=2000
set ruler               " show the cursor position all the time
set noshowcmd           " display incomplete commands
set incsearch           " do incremental searching
set showmatch
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set backspace=2 " make backspace work like most other apps
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set nonu
set nowrap
set showbreak=...
set mouse=a
set ic    " ignore case. use \C to reactivate.


" use ,f to jump to tag in a vertical split
nnoremap <silent> ,f :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>


" remap Ctrl-ArrowKeys to move between split buffers
" -------------------------------------------------------------------------------------------------------
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l

" vsplit to hsplit
nnoremap <silent> <C-w>- <C-w>t<C-w>K
" hsplit to vsplit
nnoremap <silent> <C-w>i <C-w>t<C-w>H

" http://vim.wikia.com/wiki/Using_tab_pages
" Instead of CTRL+arrow LEFT|RIGHT, I prefer the same keys sequence used in
" terminal, ie CTRL+page UP|DOWN.
" nnoremap <C-Left> :tabprevious<CR> 
" nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>






if IsGCMLEAFED()
  set tags=$GCMLEAF/CTAGS " read tags file from $GCMLEAF
endif


" **********************************************************************************
"
"                                CUSTOM BUNDLE SECTION
"
" **********************************************************************************

" ------------------------------------------
"                HARD MODE
" ------------------------------------------
" activate hard mode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
nnoremap <F10> :call ToggleHardMode()<CR>

" ------------------------------------------
"               TASK LIST
" ------------------------------------------
map <leader>td <Plug>TaskList

" ------------------------------------------
"                TAG BAR
" ------------------------------------------
" let g:tagbar_ctags_bin = '/kdtcaelegue/elegue/bin/bin/ctags'
" I put ctags into /home/emmanuel.legue/bin/ folder and it works, because this
" folder is in the beginning of the PATH.
nnoremap <F12> :TagbarToggle<CR>

" ------------------------------------------
"               ConqueGdb
" ------------------------------------------
nnoremap <silent> <F8> :ConqueGdbVSplit<CR>

nnoremap <silent> <F7> :ConqueTermVSplit /usr/bin/env bash<CR>
let g:ConqueTerm_ReadUnfocused = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0


" ------------------------------------------
"                  GREP
" ------------------------------------------
nnoremap <silent> <F6> :Rgrep<CR>
" -I Process a binary file as if it did not contain matching data
" -i Ignore case distinctions in both the PATTERN and the input files
let Grep_Default_Options = '-I -i'
if IsGCMLEAFED()
  let Grep_Skip_Dirs = "'.*' '*rt_test*' '*test_rt*' 'T[0-9][0-9][0-9]' '*test_acd*' 'test'"
else
  let Grep_Skip_Dirs = "'.*'"
endif
let Grep_Skip_Files = '[CE]TAGS  *.bak  *~ ChangeLog .*'

" ------------------------------------------
"                   AIRLINE 
" ------------------------------------------


set t_Co=256     " enable colors in terminal environment.
set laststatus=2 " to display statusline.
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
" This last definition of airline_left_sep that is empty allows a clean status
" line, because the arrow is not tall enough.
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" The previous comment is also valid here.
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


let g:airline_section_x =  '%{airline#extensions#tagbar#currenttag()}'
let g:airline_section_y = 'BN: %{bufnr("%")}' 
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" let g:airline_section_y = '%{CapsLockStatusline()}' " need vim-capslock, but
" this plugin was removed because it can not cope with keyboard capslock
" status.
let g:airline_section_z = '%3p%% %l:%c' 
let g:airline#extensions#tagbar#enabled = 1

" ------------------------------------------
"                COLORSCHEME
" ------------------------------------------
" colorscheme c
" 
let g:solarized_termcolors=256
set background=light
colorscheme solarized
call togglebg#map("<F2>")

" ------------------------------------------
"                COMMENTARY
" ------------------------------------------

if IsGCMLEAFED()
  au BufRead,BufNewFile *.in  setfiletype in
  au BufRead,BufNewFile *.out setfiletype out

  autocmd FileType in  set commentstring=//\ %s
  autocmd FileType out set commentstring=//\ %s
endif

" ------------------------------------------
"                MAKESHIFT
" ------------------------------------------
if IsGCMLEAFED()
  let g:makeshift_root = $GCMLEAF
  " echo g:makeshift_root
  nnoremap    <F3>   :<C-U>MakeshiftBuild OPT=d<CR>
  nnoremap    <F4>   :<C-U>MakeshiftBuild OPT=o<CR>

  let g:makeshift_systems = {'GCMmake': 'gcmmake code',
                         \   'GCMprod': 'gcmmake code', 
                         \  }


else 
  nnoremap    <F4>   :<C-U>MakeshiftBuildo<CR>
endif

" ------------------------------------------
"                CTRLSPACE
" ------------------------------------------
set hidden
let g:airline_exclude_preview = 1

" **********************************************************************************
"
" CALL PERSONAL DEFINTION, to add or override some declarations.
"
" **********************************************************************************

if filereadable($HOME . "/.vim/personal_config.vim")
  source $HOME/.vim/personal_config.vim
endif
