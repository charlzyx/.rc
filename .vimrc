" ------------------------------------------------------------
" -- Layer base config --------------------------------------------
" ------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let mapleader=' '
set hlsearch
set number
set scrolloff=8
set expandtab
set sw=2
set tabstop=2
set softtabstop=2
set nocompatible               " Be iMproved
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" ------------------------------------------------------------
" -- Layer key mapping ---------------------------------------
" ------------------------------------------------------------
" Vim Settings
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
nnoremap ? *
vnoremap ? *
nnoremap * ?
vnoremap * ?
nnoremap U <c-r>
vnoremap v <esc>
nnoremap Y "+y<cr>
vnoremap Y "+y<cr>
nnoremap P "+p<cr>
vnoremap P "+p<cr>
imap jj <esc>
imap jk <esc>
nnoremap <leader>vc :edit ~/.vimrc<CR>
nnoremap <leader>vs :so ~/.vimrc<CR>
nnoremap <leader>pp :PlugInstall<CR>
nnoremap <leader>w <c-w>
nnoremap <leader>wd :q<cr>
nnoremap <leader>jj :jumps<cr>
nnoremap <leader>mm :marks<cr>
" whichkey
nnoremap <leader>kk :WhichKey '<Space>'<CR>
vnoremap <leader>kk :WhichKey '<Space>'<CR>
" EasyMotion
map ,, <Plug>(easymotion-prefix)
map ,,s <Plug>(easymotion-s2)
map ,,/ <Plug>(easymotion-sn)
map ,,h <Plug>(easymotion-linebackward)
map ,,j <Plug>(easymotion-j)
map ,,k <Plug>(easymotion-k)
map ,,l <Plug>(easymotion-lineforward)
map ,,. <Plug>(easymotion-repeat)
"
call plug#begin('~/.vim/plugged')
" ------------------------------------------------------------
" -- Layer nerdtree ----------------------------------------
" ------------------------------------------------------------
Plug 'scrooloose/nerdtree'
let nerdtreequitonopen = 0
let NERDTreeShowHidden=0
let nerdchristmastree=1
let g:nerdtreewinsize = 25
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let g:rooter_patterns = ['.git/']
let g:nerdtreeindicatormapcustom = {
        \ "modified"  : "✹",
        \ "staged"    : "✚",
        \ "untracked" : "✭",
        \ "renamed"   : "➜",
        \ "unmerged"  : "═",
        \ "deleted"   : "✖",
        \ "dirty"     : "✗",
        \ "clean"     : "✔︎",
        \ 'ignored'   : '☒',
        \ "unknown"   : "?"
        \ }
" ------------------------------------------------------------
" -- Layer EasyMotion ----------------------------------------
" ------------------------------------------------------------
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1

" ------------------------------------------------------------
" -- Layer Theme -----------------------------------------------
" ------------------------------------------------------------
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'

" ------------------------------------------------------------
" -- Layer startify ----------------------------------------
" ------------------------------------------------------------
Plug 'mhinz/vim-startify'

" ------------------------------------------------------------
" -- Layer whichKey ----------------------------------------
" ------------------------------------------------------------
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" ------------------------------------------------------------
" -- Layer airline ----------------------------------------
" ------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ------------------------------------------------------------
" -- Layer visual-multi ----------------------------------------
" ------------------------------------------------------------
Plug 'mg979/vim-visual-multi'

" ------------------------------------------------------------
" -- Layer easy-align ----------------------------------------
" ------------------------------------------------------------
Plug 'junegunn/vim-easy-align'

" ------------------------------------------------------------
" -- Layer co cc----------------------------------------
" ------------------------------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ------------------------------------------------------------
" -- Layer indentLine ----------------------------------------
" ------------------------------------------------------------
Plug 'Yggdroot/indentLine'

" ------------------------------------------------------------
" -- Layer Language ----------------------------------------
" ------------------------------------------------------------
Plug 'chr4/nginx.vim'
Plug 'leafgarland/typescript-vim'

call plug#end()
