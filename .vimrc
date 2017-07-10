" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
"
" Vundle specific inclusions
"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" @nathandh See also: https://developer.mozilla.org/en-US/docs/YouCompleteMe
let g:ycm_confirm_extra_conf = 0
"http://vi.stackexchange.com/questions/2505/youcompleteme-in-non-code-files-yields-user-defined-completion-unp-patte
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1, 'html':1 }
let g:ycm_collect_identifiers_from_tags_files = 1
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
" NerdTree
Plugin 'scrooloose/nerdtree'
"
" Vim-Colors-Solarized
Plugin 'altercation/vim-colors-solarized'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" VUNDLE help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ---End Vundle specific inclusions

" Powerline Setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	" Ctrl-x + Ctrl-o
	set omnifunc=syntaxcomplete#Complete        
	" activate autocomplete with <C-X><C-O>, navigate with <C-N> and <C-P>
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
	"autocmd FileType html,xml source ~/.vim/bundle/vim-closetag/plugin/closetag.vim 
	"See more at: https://docs.oseems.com/general/application/vim/auto-complete-html#sthash.EVEDmPdj.dpuf
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"Set the status line options. Make it show more information.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
 
"Set Color Scheme and Font Options
set term=screen-256color
set t_Co=256
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
"set guifont=Consolas:h12

"Nerdtree mapping
map <C-n> :NERDTreeToggle<CR>

"set line no, buffer, search, highlight, autoindent and more.
set nu
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set paste
"Code folding specific
"folding settings
set foldmethod=indent	"fold based on indent
set foldnestmax=10	"deepest fold is 10 levels
set nofoldenable	"don't fold by default
set foldlevel=1
"
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set noerrorbells
set novisualbell
set showcmd
set mouse=a
set history=1000
set undolevels=1000

"Speed up VIM; especially from terminal in Putty
" see: https://www.atomaka.com/blog/slow-redraws-in-vim-terminal-edition/
set lazyredraw
set ttyfast

" 80 character limit, visual highlight
" see: http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Set YANK to greater than default 50 lines, is 1000 lines limit here
" see: https://groups.google.com/forum/#!topic/vim_use/WQdUy6HmtL8
:set viminfo='20,<1000,s10,h
