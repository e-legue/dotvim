" launch pathogen plugin.
source /home/emmanuel.legue/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect( '/home/emmanuel.legue/.vim/bundle/{}')

function! IsGCMLEAFED()
  return $GCMLEAF != "/misc/altbuildor/ref/altenv-3.3"
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
set nu
set nowrap
set showbreak=...
set mouse=a
set ic    " ignore case. use \C to reactivate.
set nocompatible
set hidden      
set cursorline
set showtabline=0 " to force notion of tab on ctrl-space.


set path+=**
set wildmenu


" use ,f to jump to tag in a vertical split
nnoremap <silent> <leader>t :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>

nnoremap ,icfh :-1read $HOME/.vim/.c_function_header.txt<CR>7w


au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

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

" https://shapeshed.com/vim-netrw/
" Vex, Sex, Explore
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=3  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap <silent> <F11> :!gcmtags<CR>
command! MakeTags !gcmtags<CR>

cabbrev vb vert sb


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
nnoremap <silent> <leader>h <Esc>:call ToggleHardMode()<CR>
nnoremap <silent> <F10> :call ToggleHardMode()<CR>

" ------------------------------------------
"               TASK LIST
" ------------------------------------------
" map <silent> <leader>td <Plug>TaskList

" ------------------------------------------
"                TAG BAR
" ------------------------------------------
" let g:tagbar_ctags_bin = '/kdtcaelegue/elegue/bin/bin/ctags'
" I put ctags into /home/emmanuel.legue/bin/ folder and it works, because this
" folder is in the beginning of the PATH.
nnoremap <silent> <F12> :TagbarToggle<CR>

" ------------------------------------------
"               ConqueGdb
" ------------------------------------------
nnoremap <silent> <F8> :ConqueGdbVSplit<CR>

nnoremap <silent> <F7> :ConqueTermVSplit /usr/bin/env bash<CR>
let g:ConqueTerm_ReadUnfocused = 1
" let g:ConqueTerm_CloseOnEnd = 1
" let g:ConqueTerm_StartMessages = 0


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
"                SOLARIZED
" ------------------------------------------
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
  au BufRead,BufNewFile *.yca setfiletype yaml
  au BufRead,BufNewFile *.ebnf setfiletype ebnf

  autocmd FileType in  set commentstring=//\ %s
  autocmd FileType out set commentstring=//\ %s
  autocmd FileType yaml set commentstring=#\ %s
  autocmd FileType ebnf set commentstring=#\ %s

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
"               CONQUE-GDB
" ------------------------------------------
nmap <LocalLeader>du :silent execute 'ConqueGdbCommand until ' . line('.')<CR>
nmap <LocalLeader>dp :silent execute 'ConqueGdbCommand print ' . GetGdbExpr()<CR>
nmap <LocalLeader>dP :silent execute 'ConqueGdbCommand print *' . GetGdbExpr()<CR>

vmap <LocalLeader>dp "ly:ConqueGdbCommand print <C-R>l<CR>
vmap <LocalLeader>dP "ly:ConqueGdbCommand print *(<C-R>l)<CR>

function! GetGdbExpr()
  let curpos = getcurpos()
  let line = getline('.')
  let [lnum, col2] = searchpos('\>', 'c')
  let col2 = col2 - 1
  " if expression is followed by indexing, i.e., [...], include it
  if line[col2] == '['
    let [lnum, col2] = searchpairpos('\[', '', '\]')
  endif
  call setpos('.', curpos)
  let [lnum, col1] = searchpos('\<', 'bc')
  while col1 >= 4 && (line[col1-3:col1-2] == '->' || line[col1-2:col1-2] == '.')
    " if we have (...)->, include the whole parenthesis
    if line[col1 - 4] == ')'
      normal 5h
      let [lnum, col1] = searchpairpos('(', '', ')', 'b')
    else
      " if we have [...]->, include the indexing and keep going back
      if line[col1 - 4] == ']'
        normal 5h
        let [lnum, col1] = searchpairpos('\[', '', '\]', 'b')
      endif
      " find beginning of word
      normal 2h
      let [lnum, col1] = searchpos('\<', 'bc')
    endif
  endwhile
  call setpos('.', curpos)
  return line[col1-1:col2-1]
endfunction



" **********************************************************************************
"
" CALL PERSONAL DEFINTION, to add or override some declarations.
"
" **********************************************************************************

if filereadable($HOME . "/.vim/personal_config.vim")
  " source $HOME/.vim/personal_config.vim
endif

if has('gui_running')
    " gvim specific settings here
    set guifont=Monospace\ 8
endif
