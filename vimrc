execute pathogen#infect()
execute pathogen#helptags()

syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

set foldmethod=indent
set foldlevel=99


" HARD MODE
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" TASK LIST
map <leader>td <Plug>TaskList

" TAG BAR
nmap <F9> :TagbarToggle<CR>

" GREP VIM
nnoremap <silent> <F5> :Grep<CR>
:let Grep_Default_Options = '-iI'
:let Grep_Skip_Dirs = '.git'
:let Grep_Skip_Files = '[CE]TAGS *.bak *~ ChangeLog'


" AIRLINE
" set t_Co=256


" uses a monospace font, size equals 8.
set guifont=Monospace\ 8

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" set a custom make.

" nnoremap <silent> dmake :execute "OPT=d gcmmake code"
" nnoremap <silent> clean :execute "gcmclean code"

" Disable in order to use c.vim coloring syntax.
" colorscheme pablo

" opens each buffer in its own tabpage (ref: http://vim.wikia.com/wiki/VimTip1317)
":au BufAdd,BufNewFile * nested tab sball



set laststatus=2 "to display statusline.
" " http://got-ravings.blogspot.ca/2008/08/vim-pr0n-making-statuslines-that-own.html
" set statusline=
" set statusline+=%<\                                 " cut at start
" set statusline+=%2*[%n%H%M%R%W]%*\                  " flags and buf no
" set statusline+=%f\                                 " path
" set statusline+=%{tagbar#currenttag('[%s]','')}\    " current function
" set statusline+=%{fugitive#statusline()}\           " git status
" set statusline+=%=\                                 " right align
" " set statusline+=%1*%y%*%*\                        " file type
" set statusline+=%10((%l,%c)%)\                      " line and column
" set statusline+=%P                                  " percentage of file

hi statusline guibg=black "display statusline with a black background


" add a new filetype to be able to easily comment/uncomment input file.
au BufNewFile,BufRead *.in set filetype=in

" http://vim.wikia.com/wiki/VimTip369
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java,in let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>


" remap Ctrl-ArrowKeys to move between split buffers
" -------------------------------------------------------------------------------------------------------
" Figure out exactly what escape sequence your terminal sends for Ctrl+arrow by typing Ctrl+V, Ctrl+arrow
" in insert mode: this will insert the leading ESC character (shown as ^[ in vim) literally, followed by
" the rest of the escape sequence. Then tell vim about these escape sequences with something like
"nnoremap <silent> [5C <c-w>l
"nnoremap <silent> [5D <c-w>h
"nnoremap <silent> [5A <c-w>k
"nnoremap <silent> [5B <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l

" http://vimcolorschemetest.googlecode.com/svn/html/index-html.html
"colorscheme candycode
colorscheme DevC++

set nu
set wrap
set showbreak=...

let g:airline_powerline_fonts = 1


set encoding=utf-8
set laststatus=2
" set fillchars+=stl:\ , stlnc:\ 
