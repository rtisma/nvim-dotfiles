""""""""""""""""""""""""""""""""""""""""""""""''
" vim-plug config
" Refer to examples https://github.com/junegunn/vim-plug#example
""""""""""""""""""""""""""""""""""""""""""""""''
" Automatic installation
if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		echo 'Installing vim-plug for nvim'	
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif
if has('vim')
	if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

call plug#begin()
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/dhruvasagar/vim-open-url'
Plug 'https://github.com/scrooloose/nerdTree'
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'https://github.com/SidOfc/mkdx'
Plug 'https://github.com/roxma/vim-tmux-clipboard'

" Git stuff
Plug 'https://github.com/tpope/vim-fugitive' , { 'tag' : 'v2.5' }
Plug 'https://github.com/gregsexton/gitv'

Plug 'https://github.com/jiangmiao/auto-pairs'
" Use these if auto-pairs sucks
"Plug 'https://github.com/raimondi/delimitmate'
"Plug 'https://github.com/townk/vim-autoclose'

Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/benmills/vimux'
Plug 'https://github.com/junegunn/vim-easy-align'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/ekalinin/dockerfile.vim'

" Also cool
"Plug 'https://github.com/christoomey/vim-tmux-navigator'
"Plug 'https://github.com/svermeulen/vim-easyclip'
"Plug 'https://github.com/elzr/vim-json'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  General Vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Language cheatsheet: https://devhints.io/vimscript
let mapleader = ","
set wrap "enable wrapping. Use `set nowrap` to disable
set nu "enable numbering. Use `set nonu` to disable
set tabstop=4 "a tab will have the same length as 4 whitespaces
set shiftwidth=0 " always have tab match tabstop

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Delete the word under the cursor
nnoremap df bdw

" Insert mode and new line
map <S-Enter> i<CR><Esc>

" Normal mode and new line
map <Enter>  o<Esc>

" Switch between vim windows using CTRL and arrow keys
map <C-j>  <C-w>j
map <C-k>  <C-w>k
map <C-h>  <C-w>h
map <C-l>  <C-w>l

"This turns "jk" into <esc>. Will save you the time for hitting esc
inoremap jk <esc>

" The leader defaults to backslash, so (by default) this
" maps \* and \g* (see :help Leader).
" These work like * and g*, but do not move the cursor and always set hls.
map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>

" open vimrc using :Vimrc
command! Vimrc :sp $MYVIMRC
command! Reload :source $MYVIMRC


" Cycle through buffers. Usefull with ctrlp
nnoremap xl :bnext<CR>
nnoremap xh :bprevious<CR>
nnoremap xd :bdelete<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""''
"     Solarized config
"     https://github.com/iCyMind/NeoSolarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Increatse the speed of the gutter symbol refresh rate
" https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=0

""""""""""""""""""""""""""""""""""""""""""""""""''
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""
"To install fonts manually run the following:
" curl https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -create-dirs -o ~/.local/share/fonts/PowerlineSymbols.otf
" curl https://raw.githubusercontent.com/powerline/powerline/develop/font/10-powerline-symbols.conf -create-dirs -o ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
" fc-cache -vf ~/.local/share/fonts/
" Taken from https://powerline.readthedocs.io/en/master/installation/linux.html#fontconfig
if exists(':AirlineRefresh')
	echo 'hi, airline exists!'
endif
if empty(glob('~/.config/fontconfig/conf.d/10-powerline-symbols.conf')) || empty(glob('~/.local/share/fonts/PowerlineSymbols.otf')) 
	if empty(glob('~/.local/share/fonts/PowerlineSymbols.otf'))
		echo 'Installing PowerlineSysbols'
		silent !curl -fLo ~/.local/share/fonts/PowerlineSymbols.otf --create-dirs https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	endif
	if empty(glob('~/.config/fontconfig/conf.d/10-powerline-symbols.conf'))
		echo 'Installing PowerlineSysbols conf'
		silent !curl -fLo ~/.config/fontconfig/conf.d/10-powerline-symbols.conf	--create-dirs https://raw.githubusercontent.com/powerline/powerline/develop/font/10-powerline-symbols.conf 
	endif
	echo 'fc-cache-ing...'
    silent !fc-cache -vf ~/.local/share/fonts/
	echo 'Done installing powerline fonts for vim-airline!'
endif

" enable powerline fonts (the stuff you installed above)
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='badwolf'
let g:airline_extensions = ['branch', 'tabline']
"let g:airline_theme='deus'
"let g:airline_theme='papercolor'
"let g:airline_theme='solarized'
"let g:airline_theme='sol'
"let g:airline_theme='luna'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-open-url
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,w to open the link
nmap <Leader>w <Plug>(open-url-browser)

" ,g to search the text under the cursor in google
nmap <Leader>g <Plug>(open-url-google-search)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdTree config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2 "automatically sets current root
imap <C-n> <ESC>:NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-surround config
" Primarily used for html/xml editing
" Plug 'https://github.com/tpope/vim-surround'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Refer to tutorial: https://github.com/tpope/vim-surround#surroundvim
"  cs"' ---> with cursor inside \" surrounded text, this with CHANGE " to '
"  cst' ---> with cursor inside any surrounded text, this with remove the
"            surround and replace with '
"  ds"  ---> with cursor inside \" surrounded text, will delete it
"  ysiw] ---> will add ] surround to whatever word is under cursor
"  yss)  ---> will surround the whole line with )
"  S<something> ---> after selecting text in visual mode, this will surround
"                    with <something>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <c-f>    cycle through modes
" <c-d>    only search filename and not path
" <c-r>    search using regexp mode
" <c-j>, <c-k>  navigate list
" <c-t>    open selection in new tab
" <c-v>    open selection in vertial split
" <c-x>    open selection in horizontal split
" <c-p>    like ctrl-r in bash
" ? then enter  will show help menu
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   EasyMotion
"   Trigger with <leader><leader> and annotates words with jump points to
"   jump to them
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for shortcuts -->   :help easymotion-default-mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-eunuch
" Adds unix file operations
" :help eunuch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown-preview for neovim
" Opens in browser and browser scrolls to your vim cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>m :MarkdownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  mkdx
"  plugin that reduzcxes time spent formatting. Theres alot to configure
"  For example: deadlink detection, TOC creation and updating
" :h mkdx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" list of mappings https://github.com/SidOfc/mkdx#mappings
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>t :TlistToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>r  :VimuxPromptCommand<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
