let g:python_host_prog='/usr/bin/python2.7'
" Vundle
set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
if has('nvim')
    set rtp+=~/.nvim/bundle/Vundle.vim
    call vundle#begin('~/.nvim/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" youcompleteme doesn't seem to work. Some python-version-problem
"Plugin 'Valloric/YouCompleteMe'

"and neocomplete requires lua, which isn't in the default macvim
"Bundle 'Shougo/neocomplete'

" graphical undo-tree
Plugin 'vim-scripts/Gundo'

"disabled because it messes with too many things...
"Plugin 'raimondi/delimitmate'

Plugin 'b4winckler/vim-angry'

Plugin 'vim-scripts/Mark'

Plugin 'fholgado/minibufexpl.vim'

Plugin 'mfukar/robotframework-vim'

" trying something out with this...temporary
Plugin 'bfredl/nvim-ipy'

if has('nvim')
    Bundle 'https://github.com/freeo/vim-kalisi'
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" python spaces
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set colorcolumn=80

set showcmd
set ruler

" numbers
set nu

" syntax highlighting
syntax on
syn sync fromstart

" auto-indent
filetype indent on
set autoindent

" line wrapping
set lbr

" color scheme
" colorscheme delek
" colorscheme murphy
" colorscheme desert
if has('nvim')
    colorscheme kalisi
    set background=light
else
    colorscheme solarized
    " when running macvim this happens automatically, but in my terminal it
    " doesn't...
    set background=light
endif

" pattern matching while typing
set incsearch

" highlight matches
set hlsearch

" LaTeX plugin
filetype plugin on
set grepprg=grep\-nH\ $*


" MiniBufExplorer
" based on http://blog.dispatched.ch/2009/05/24/vim-as-python-ide/
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" set MBE on top even though I'm setting splitbelow 
let g:miniBufExplSplitBelow = 0


" code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType C set fdm=syntax

" have bash-style tab-completion on files
" based on http://blog.sanctum.geek.nz/vim-filename-completion/
if has("wildmenu")
	set wildmenu
	set wildmode=longest,list
endif

set splitright
set splitbelow

" seen at https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
set list
set listchars=tab:▸\ 

" Cursorline
" Only show cursorline in the current window and in normal mode.
set cursorline
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    "au InsertEnter * set nocursorline
    "au InsertLeave * set cursorline
augroup END


set scrolloff=3

set hidden

" It's 2012.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Stamping http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
nnoremap S "_diwP

" based on http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menuone

" autocompletion shouldn't hijack my enter-key - http://stackoverflow.com/questions/17043699/how-can-i-remap-autocompletion-in-vim
inoremap <expr> <CR> pumvisible() ? '<C-e><CR>' : '<CR>'

" TODO try out plugin 'endwise'



if has('nvim')

    function StartTerminal()
        terminal bash -l
        set fdm=marker
        set scrolloff=0
    endfunction

    command Term call StartTerminal()



    tnoremap <Esc> <C-\><C-n>
    let g:terminal_scrollback_buffer_size=100000
endif
