set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

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
imap `` <esc>
nmap ; :

" python 
autocmd Filetype python set list listchars=tab:>-

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
let g:closetag_filenames = '*.html.*,*.xhtml.*,*.phtml.*'

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
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_min_num_of_chars_for_completion = 2 " disable identifier completion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_diagnostics_to_display = 0


" highlight after 80 columns
:set colorcolumn=81 
hi ColorColumn ctermbg=5 guibg=yellow
" not fo html
autocmd BufEnter *.html* set colorcolumn=
