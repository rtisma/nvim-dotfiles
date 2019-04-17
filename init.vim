""""""""""""""""""""""""""""""""""""""""""""""''
" vim-plug config
" Refer to examples https://github.com/junegunn/vim-plug#example
""""""""""""""""""""""""""""""""""""""""""""""''
call plug#begin()
Plug 'iCyMind/NeoSolarized'
Plug 'airblade/vim-gitgutter'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  General Vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap
set nu
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""''
"     Solarized config
"     https://github.com/iCyMind/NeoSolarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors
colorscheme NeoSolarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Increatse the speed of the gutter symbol refresh rate
" https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=0

