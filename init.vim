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
" Markdown processing
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'https://github.com/gabrielelana/vim-markdown'
Plug 'https://github.com/SidOfc/mkdx'

" File and text searching 
Plug 'https://github.com/scrooloose/nerdTree'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/bronson/vim-visual-star-search'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Appearance
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/tyrannicaltoucan/vim-quantum'
Plug 'https://github.com/chrisbra/colorizer'
Plug 'https://github.com/altercation/vim-colors-solarized'
" Removed since already integrated in airline Plug 'https://github.com/bling/vim-bufferline'

" Syntax highlighting
Plug 'https://github.com/ekalinin/dockerfile.vim'
Plug 'https://github.com/stephpy/vim-yaml'
Plug 'https://github.com/uarun/vim-protobuf'
Plug 'https://github.com/soramugi/auto-ctags.vim'
Plug 'https://github.com/craigemery/vim-autotag'
Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/elzr/vim-json'

" Code formatting
Plug 'https://github.com/junegunn/vim-easy-align'
Plug 'https://github.com/chiel92/vim-autoformat'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
Plug 'https://github.com/townk/vim-autoclose'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tmux-plugins/vim-tmux'
Plug 'https://github.com/matze/vim-move'
" Alternative if vim-autoclose starts acting up
"     Plug 'https://github.com/raimondi/delimitmate'

" Git stuff
Plug 'https://github.com/tpope/vim-fugitive' , { 'tag' : 'v2.5' }
Plug 'https://github.com/gregsexton/gitv'
Plug 'https://github.com/arkwright/vim-radar'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/cohama/agit.vim'  "Useage :Agit

" Disabled because will delete multiple white spaces. made it really difficult to type
" Plug 'https://github.com/jiangmiao/auto-pairs'
"

" Tmux interaction
Plug 'https://github.com/benmills/vimux'
Plug 'https://github.com/roxma/vim-tmux-clipboard'

" Other Neat tools
Plug 'https://github.com/ajh17/vimcompletesme'
Plug 'https://github.com/will133/vim-dirdiff'
Plug 'https://github.com/christoomey/vim-system-copy'
Plug 'https://github.com/dhruvasagar/vim-open-url'
Plug 'https://github.com/tpope/vim-eunuch'

" Ranger - terminal filebrowser
" Note: Excluded because its buggy. Doesnt open files properly
" For example, visual select mp3 files and press r to open 
" with vlc, and doesnt work properly
"Plug 'https://github.com/francoiscabrol/ranger.vim'
"Plug 'https://github.com/rbgrouleff/bclose.vim'


" To try out later...
"Plug 'https://github.com/christoomey/vim-tmux-navigator'
"Plug 'https://github.com/svermeulen/vim-easyclip'
"Plug 'https://github.com/xolox/vim-easytags'
"Plug 'https://github.com/dkprice/vim-easygrep'
"Plug 'https://github.com/thaerkh/vim-workspace'
"Plug 'https://github.com/jez/vim-superman'
"Plug 'https://github.com/wesq3/vim-windowswap'
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

" Increase window vertical spacing
nnoremap <C-Up> :resize +5<CR>

" Decrease window vertical spacing
nnoremap <C-Down> :resize -5<CR>

" Increase window horizontal spacing
nnoremap <C-Right> :vertical resize +5<CR>

" Decrease window horizontal spacing
nnoremap <C-Left> :vertical resize -5<CR>

" While in INSERT mode, move to the BEGINNING of the line
inoremap <M-h> <Home>

" While in INSERT mode, move to the END of the line
inoremap <M-l> <End>

" While in INSERT mode, move to the LEFT
inoremap <C-h> <Left>

" While in INSERT mode, move to the RIGHT
inoremap <C-l> <Right>

" While in INSERT mode, move UP one line
inoremap <C-k> <Up>

" While in INSERT mode, move DOWN one line
inoremap <C-j> <Down>

" While in INSERT mode, move to the TOP of the file
inoremap <C-g>k <ESC>ggi

" While in INSERT mode, move to the BOTTOM of the file
inoremap <C-g>j <ESC>Gi

"This turns "jk" into <esc>. Will save you the time for hitting esc
inoremap jk <esc>

" The leader defaults to backslash, so (by default) this
" maps \* and \g* (see :help Leader).
" These work like * and g*, but do not move the cursor and always set hls.
map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>

" open vimrc using :Vimrc
command! SVimrc :sp $MYVIMRC
command! Vimrc :e $MYVIMRC
command! Reload :source $MYVIMRC

" Cycle through buffers. Usefull with ctrlp
nnoremap xl :bnext<CR>
nnoremap xh :bprevious<CR>
nnoremap xd :bdelete<CR>

set foldmethod=expr
set foldlevelstart=9999

" Replace the current line, with the yanked line, without modifying the yank
" buffer
nnoremap r p<Up>ddyy

""""""""""""""""""""""""""""""""""""""
" Taken from spf13
""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight proble
" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null
set nocompatible        " Must be first line
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set history=3000                    " Store a ton of history (default is 20)
set hidden                          " Allow buffer switching without saving
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character

" This made it really slow
"set cursorline
"highlight clear SignColumn      " SignColumn should match background
"highlight clear LineNr          " Current line number row will have same background color in relative mode

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
nmap <silent> <leader>/ :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-json config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable quote concealing for json fields/values...really annoying
let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Increatse the speed of the gutter symbol refresh rate
" https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

""""""""""""""""""""""""""""""""""""""""""""""""''
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""
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
"let g:airline_theme='badwolf'
let g:airline_theme='quantum'
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
nmap <Leader>i  <Plug>(mkdx-gen-or-upd-toc)
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
" *vimux*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>r  :VimuxPromptCommand<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cheatsheet: https://devhints.io/vim-easyalign

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
"filetype plugin on

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Spelling config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reference: https://www.ostechnix.com/use-spell-check-feature-vim-text-editor/
" z= --> suggest spelling
" zg --> add to dictionary
" zug --> remove from dictionary
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-system-copy
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Copy vim text to system clipboard
" cpiw --> copies word to system clipboad
" cpi' --> copies text inside single quotes to system clipboard
" cP  --> copy current line directly
" cv  --> past contents of system clipboard to next line

"TODO: figure out what is deleting lines empty lines. 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorizer
" When toggles on, will highlight a #hex value with the corrresponding color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>C  :ColorToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""''
"     Colorscheme config
"     https://github.com/iCyMind/NeoSolarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
silent! colorscheme solarized
"
"
set termguicolors "needed for quantum
let g:quantum_italics=1

silent! colorscheme quantum

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     vim-markdown config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_enable_mappings = 0
let g:markdown_enable_spell_checking = 1
