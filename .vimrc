autocmd!
"To load Vundle
source bundles.vim

filetype plugin indent on                                   " enable filetype-sensitive plugins and indenting
set encoding=utf-8                                          " Set encoding
syntax on                                                   " syntax highlighting on
set hidden                                                  " buffers are hidden and not closed
set backspace=2                                             " full backspacing capabilities (indent,eol,start)
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
set undolevels=100                                          " Number of undo levels to keep
set number                                                  " Line numbers on
set timeoutlen=250                                          " Time to wait after ESC (default causes an annoying delay)
set modeline                                                " modeline overrides
set modelines=10
set splitbelow splitright                                   "new window open below and to the right"
set linebreak                                               "line wraps at word
" Keymappings ----------------------------------------------------------- 
let mapleader=","
noremap j gj
noremap k gk
nmap <silent> <leader><space> :nohlsearch<CR>
map <leader>d :execute 'NERDTreeToggle'<CR>
map <leader>j :execute 'LustyJuggler'<CR>
map <leader>r :execute 'YRShow'<CR>
nmap <leader>w :w!<cr>
ino fj <esc>
cno fj <c-c>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]
" Fix vertsplit window sizing
nmap <C-Left> <C-W>><C-W>>
nmap <C-Right> <C-W><<C-W><
" insert new line without going into insert mode
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> :put!=''<CR>
"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X
" Formatting -----------------------------------------------------------
set tabstop=4                                               " Tabs are 2 spaces
set shiftwidth=4                                            " Tabs under smart indent
set softtabstop=4
set expandtab
set smarttab
set shiftround                                              " when at 3 spaces, hitting tab goes to 4, not 5
" when using list, keep tabs at their full width and display `arrows':
" (Character 187 is a right double-chevron, and 183 a mid-dot.)
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
set formatoptions=tcqr
set autoindent
set smartindent
" statusline -----------------------------------------------------------
set laststatus=2                                            " Always show status line.
set cmdheight=2                                             " command line height
set ruler                                                   " show cursor position in status line
set showmode                                                " show mode in status line
" Custom status line
set statusline=                                             " first, clear the status line
set statusline=%<\                                          " cut at start
set statusline+=%F\                                         " full path
set statusline+=%(%y%)\                                     " file type
set statusline+=%=                                          " seperate between right- and left-aligned
set statusline+=%([%M%R%H%W]%)\                             " buffer number, and flags
set statusline+=%((%l/%L)%),%c%V\                           " vertical line number, horizontal line number 
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
" Command-T ----------------------------------------------------------
let g:CommandTMaxHeight = 30 
set wildignore+=.git
map <leader>f :execute "CommandT"<cr>
" ZoomWin configuration --------------------------------------------------
map <Leader><Leader> :ZoomWin<CR>
" CTags ----------------------------------------------------------------
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
" Thorfile, Rakefile and Gemfile are Ruby ------------------------------
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby
" Unimpaired configuration -------------------------------------
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
"SuperTab 
let g:SuperTabDefaultCompletionType = "context""
" Visual ---------------------------------------------------------------
set cursorline                                              " highlight current line
set title
set visualbell                                              " No blinking .
set noerrorbells                                            " No noise.
set t_vb=
set tm=500
" GUI specific ----------------------------------------------------------
set mousehide                                               " Hide mouse after chars typed
set mouse=a                                                 " Mouse in all modes
set guifont=Monaco:h13
set guicursor+=a:blinkon0

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <leader>f :CommandT<CR>
  imap <leader>f <Esc>:CommandT<CR>
  macmenu &File.New\ Tab key=<D-T>
  
  " Command-e for ConqueTerm
  map <D-e> :call StartTerm()<CR>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

endif
" Start without the toolbar
set guioptions-=T
" Default gui color scheme
color ir_black
" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction
" Project Tree
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
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

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction
" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction
" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . a:dir
  let stay = exists("a:1") ? a:1 : 1

  NERDTree

  if !stay
    wincmd p
  endif
endfunction

function Touch(file)
  execute "!touch " . a:file
  call s:UpdateNERDTree()
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . a:file
  endif

  call s:UpdateNERDTree()
endfunction

function Mkdir(file)
  execute "!mkdir " . a:file
  call s:UpdateNERDTree()
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . a:file

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . a:file)}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(system("dirname " . a:file), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")
call s:DefineCommand("e", "Edit")
call s:DefineCommand("mkdir", "Mkdir")
