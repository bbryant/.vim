autocmd!

set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle 'bling/vim-airline'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nono/jquery.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-haml'
"NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bufexplorer.zip'
NeoBundle 'ervandew/supertab'
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'LustyJuggler'
NeoBundle 'ZoomWin'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'mbbill/undotree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'

" vim-scripts repos
"NeoBundle 'FuzzyFinder'
" Non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" gist repos
"NeoBundle 'gist:Shougo/656148', {
"      \ 'name': 'everything.vim',
"      \ 'script_type': 'plugin'}
" Non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

set encoding=utf-8                                          " Set encoding
syntax on                                                   " syntax highlighting on

set hidden                                                  " buffers are hidden and not closed
set backspace=indent,eol,start                              " backspace for dummys
set linespace=0                                             " no extra spaces between rows
set showmatch                                               " show matching brackets
set mat=2                                                   " how many tenths of a second to blink
set wildmenu                                                " show list instead of just completing
set wildmode=list:longest,full                              " comand <Tab> completion, list matches, then longest common part, then all.
set scrolloff=3                                             " minimum lines to keep above and below cursor
set autoread                                                " reload file if vim detects it changed elsewhere
set clipboard+=unnamed                                      " Yanks go on clipboard instead.
set history=256                                             " Number of things to remember in history.
set undolevels=1000                                         " Number of undo levels to keep
if has("persistent_undo")
    set undodir = "~/.undodir/"
    set undofile
endif
set number                                                  " Line numbers on
set timeoutlen=250                                          " Time to wait after ESC (default causes an annoying delay)
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set splitbelow splitright                                   "new window open below and to the right"
set linebreak                                               "line wraps at word
" Keymappings ----------------------------------------------------------- 
let mapleader=","
let g:EasyMotion_leader_key = '<Space>'
"nnoremap <F5> :UndotreeToggle<cr>
nnoremap <F5> :GundoToggle<CR>
noremap j gj
noremap k gk
nmap <CR> o<Esc>k
" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk
nmap <silent> <leader><space> :nohlsearch<CR>
map <leader>d :execute 'NERDTreeToggle'<CR>
"map <leader>r :execute 'YRShow'<CR>
map <leader>f :execute "CtrlP"<CR>
"map <leader>b :execute 'CtrlPBuffer'<cr>
nmap <leader>w :w!<CR>
ino fj <esc>
cno fj <c-c>
vno fj <esc>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Adjust viewports to the same size
map <Leader>= <C-w>=
" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]
" Fix vertsplit window sizing
nmap <C-Left> <C-W>><C-W>>
nmap <C-Right> <C-W><<C-W><
"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X
" Formatting -----------------------------------------------------------
set tabstop=2                                               " Tabs are 2 spaces
set shiftwidth=2                                            " Tabs under smart indent
set softtabstop=2
set expandtab
set smarttab
set shiftround                                              " when at 3 spaces, hitting tab goes to 4, not 5
" when using list, keep tabs at their full width and display `arrows':
" (Character 187 is a right double-chevron, and 183 a mid-dot.)
"execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
set formatoptions=tcqr
set autoindent
set smartindent
" Code Folding ---------------------------------------------------------
set foldmethod=indent                                       "fold based on indent
set foldnestmax=20                                          "deepest fold levels
set nofoldenable                                            "dont fold by default
set foldlevel=1                                             "this is just what i use
" statusline -----------------------------------------------------------
set laststatus=2                                            " Always show status line.
"set cmdheight=2                                             " command line height
"set ruler                                                   " show cursor position in status line
"set showmode                                                " show mode in status line
" Custom status line
"set statusline=                                             " first, clear the status line
"set statusline=%<\                                          " cut at start
"set statusline+=%F\                                         " full path
"set statusline+=%(%y%)\                                     " file type
"set statusline+=%=                                          " seperate between right- and left-aligned
"set statusline+=%([%M%R%H%W]%)\                             " buffer number, and flags
"set statusline+=%((%l/%L)%),%c%V\                           " vertical line number, horizontal line number 
"Searching ------------------------------------------------------------
set hlsearch                                                " highlight all search results
set incsearch                                               " increment search
set ignorecase                                              " case-insensitive search
set smartcase                                               " uppercase causes case-sensitive search
set wrapscan                                                " searches wrap back to the top of file
"Backups ------------------------------------------------------------------
set nobackup
set nowb
set noswapfile
"bufExplorer plugin ---------------------------------------------------
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>b :BufExplorer<cr>
" Tagbar --------------------------------------------------fhmw
map <Leader>t :TagbarOpenAutoClose<CR>
let g:tagbar_left = 1                                       " Open tagbar on the left
let g:tagbar_sort = 0
" ZoomWin configuration --------------------------------------------------
map <Leader><Leader> :ZoomWin<CR>
" CTags ----------------------------------------------------------------
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
" Thorfile, Rakefile and Gemfile are Ruby ------------------------------
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby
"SuperTab 
let g:SuperTabDefaultCompletionType = "context""
" Visual ---------------------------------------------------------------
"set cursorline                                              " highlight current line
set title
set visualbell                                              " No blinking .
set noerrorbells                                            " No noise.
set t_vb=
set tm=500
" GUI specific ----------------------------------------------------------
set mousehide                                               " Hide mouse after chars typed
set mouse=a                                                 " Mouse in all modes
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set guicursor+=a:blinkon0

"Default colorscheme
set background=dark
let g:solarized_termcolors=256
color solarized

if has("gui_macvim") && has("gui_running")

  set macmeta

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle

  " Start without the toolbar
  set guioptions-=T

  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  "airline font patch
  let g:airline_powerline_fonts = 1

endif

" Project Tree
let NERDTreeHijackNetrw=1

autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . a:directory
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

endfunction

" Rainbox Parentheses {{{
nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
