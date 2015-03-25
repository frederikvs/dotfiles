" Vundle
set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" youcompleteme doesn't seem to work. Some python-version-problem
"Plugin 'Valloric/YouCompleteMe'

"and neocomplete requires lua, which isn't in the default macvim
"Bundle 'Shougo/neocomplete'

" graphical undo-tree
Plugin 'vim-scripts/Gundo'

Plugin 'raimondi/delimitmate'

Plugin 'vim-scripts/Conque-GDB'

Plugin 'AutoComplPop'

Plugin 'b4winckler/vim-angry'

Plugin 'vim-scripts/Mark'

Plugin 'fholgado/minibufexpl.vim'

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
colorscheme solarized
" when running macvim this happens automatically, but in my terminal it
" doesn't...
set background=light

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

" Cursorline {{{
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

" disable acp-Plugin on conqueterm
au! WinEnter * :if &ft=='conque_term' | AcpDisable | else | AcpEnable | endif

autocmd FileType conque_term set fdm=marker

let g:ConqueTerm_ReadUnfocused = 1

" prevent \r and \n conflict between conque_gdb and mark.vim
let g:ConqueGdb_Leader = '-'

" TODO try out plugin 'endwise'
