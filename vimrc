set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vim-latex/vim-latex'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab  
set smartindent
set number
set autoindent
set expandtab 
set bg=dark
inoremap `` <esc>
nnoremap ; :

inoremap <c-j><c-j> <c-o>o
inoremap <c-k><c-k> <c-o><s-o>
inoremap <c-e> <end>
inoremap <c-b> <c-o>^
inoremap jj <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""" python """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype python set list listchars=tab:>-
let g:python_recommended_style = 0
" highlight python indentation
autocmd FileType python inoremap<c-x> <c-o>:IndentGuidesToggle<CR>
autocmd FileType python nnoremap<c-x> :IndentGuidesToggle<CR>
" comment line, selection with Ctrl-N,Ctrl-N
autocmd BufEnter *.py nnoremap  <C-N><C-N>    mn:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR>:noh<CR>`n
autocmd BufEnter *.py inoremap  <C-N><C-N>    <C-O>mn<C-O>:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR><C-O>:noh<CR><C-O>`n
autocmd BufEnter *.py vnoremap  <C-N><C-N>    mn:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR>:noh<CR>gv`n
" uncomment line, selection with Ctrl-N,N
autocmd BufEnter *.py nnoremap  <C-N>n     mn:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR>:s/^#$//ge<CR>:noh<CR>`n
autocmd BufEnter *.py inoremap  <C-N>n     <C-O>mn<C-O>:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR><C-O>:s/^#$//ge<CR><C-O>:noh<CR><C-O>`n
autocmd BufEnter *.py vnoremap  <C-N>n     mn:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR>gv:s/#\n/\r/ge<CR>:noh<CR>gv`n


" template file
autocmd BufNewFile *.cpp 0r ~/.vim/skeleton/skeleton.cpp

" open parathesis comes with a close one and pointer to middle of them
" inoremap ( ()<Esc>i
" inoremap () ()

" open { comes with a } and pointer to middle of them
" inoremap { {}<ESC>i

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html.*,*.xhtml.*,*.phtml.*,*.xml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" ycm
autocmd FileType cpp let g:ycm_global_ycm_extra_conf = '/home/panaka_13/.vim/bundle/YouCompleteMe/config/ycm_extra_conf.py'
autocmd FileType java let g:ycm_global_ycm_extra_conf = '/home/panaka_13/.vim/bundle/YouCompleteMe/config/java_ycm_extra_conf.py'
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_min_num_of_chars_for_completion = 2 " disable identifier completion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_disable_for_files_larger_than_kb = 2000
" let g:ycm_filetype_blacklist = {'python': 1}
map <F5> :YcmCompleter FixIt<CR>
map <c-g> :YcmCompleter GoTo<CR>
map <c-l><c-n> :lnext<CR>
map <c-l><c-p> :lprev<CR>

" highlight after 80 columns
set colorcolumn=81 
hi ColorColumn ctermbg=5 guibg=yellow
autocmd BufEnter *.html* set colorcolumn= " not fo html
autocmd BufEnter .vimrc set colorcolumn= " not to vimrc
autocmd BufEnter *.rb set colorcolumn=100 " ruby: 100 width text
autocmd BufEnter *.cpp,*.h set colorcolumn=120
autocmd FileType java set colorcolumn=100 " java: 100 width per line

" highlight search
set hlsearch

map <F4> :f<CR>
map <F3> :pwd<CR>
map <F2> :Vexplore<CR>

" latex - vim-latex
autocmd FileType tex let g:Tex_Env_bmatrix = "\\begin{bmatrix}\<CR>\<CR>\\end{bmatrix}"

" netrw
let g:netrw_winsize = 30
let g:netrw_browse_split = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

autocmd FileType cpp setlocal equalprg=clang-format

" syntastic with pylint
autocmd FileType python let g:syntastic_python_pylint_args = '--rcfile='.g:FindPylintrc().' -E'

" test_runner
map <leader>t :call g:RunTest()
command! Gcc :call g:CompileRun()

" golang run
command! Go :call g:CompileRun()
autocmd Filetype go setlocal equalprg=gofmt
autocmd Filetype go set tabstop=4
autocmd Filetype go set shiftwidth=4
autocmd Filetype go set softtabstop=4

set exrc
set secure

autocmd BufEnter * call g:ApplyLocalSettings(expand("<afile>:p:h"))
