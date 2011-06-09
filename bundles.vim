"vim -u bundles.vim +BundleInstall +q :use this for first time bundle import
set nocompatible                                            " We don't want vi compatibility.
filetype off                                                " Temporarily turn off filetype detection to safely load Pathogen.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'rosenfeld/conque-term'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'edsono/vim-matchit'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'majutsushi/tagbar'
Bundle 'nono/jquery.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-haml'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'actionscript.vim'
Bundle 'bufexplorer.zip'
Bundle 'LustyJuggler'
Bundle 'ZoomWin'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"After updating/install Bundles, you must build Command-T C externsions
"using
"cd ~/.vim/bundle/command-t
"rake make
