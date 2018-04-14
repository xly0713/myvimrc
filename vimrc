set nocompatible
filetype off

let mapleader = ","
let g:mapleader = ","

let $VIMHOME = $HOME . "/.vim"
let $BUNDLES = $VIMHOME . "/bundles.vim"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

if filereadable($BUNDLES)
    source $BUNDLES
endif

call vundle#end()
filetype plugin indent on

let $PLUGCFG = $VIMHOME . "/plugcfg.vim"
if filereadable($PLUGCFG)
    source $PLUGCFG
endif

let $ORICFG = $VIMHOME . "/oricfg.vim"
if filereadable($ORICFG)
    source $ORICFG
endif
