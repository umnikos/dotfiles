call plug#begin('~/.vim/plugged/')
" color schemes
Plug 'https://github.com/vim-scripts/Wombat'
Plug 'arcticicestudio/nord-vim'

" vim general
Plug 'easymotion/vim-easymotion' " ,, leader for better motions
Plug 'tpope/vim-sensible' " basic vim settings
Plug 'tpope/vim-repeat' " repeat maps as well
Plug 'vim-airline/vim-airline' " pretty status bar on the bottom
Plug 'vim-airline/vim-airline-themes' " and themes for it
Plug 'godlygeek/tabular' " line up stuff with :Tabular
Plug 'vim-scripts/vim-auto-save' " autosave
Plug 'fidian/hexmode' " :Hexmode to switch to viewing the file as hex
" Plug 'SirVer/ultisnips/' " tab-triggered snippets !broken build!
" Plug 'honza/vim-snippets' " premade snippets for ultisnips
" Plug 'dense-analysis/ale' " didn't get it to work
Plug 'camspiers/animate.vim' " I don't like animations
Plug 'camspiers/lens.vim' " automatic resizing
Plug 'tpope/vim-speeddating' " C-X/C-A to increment/decrement dates

" notes
Plug 'xolox/vim-misc' " dependency of vim-notes
" Plug 'xolox/vim-notes' " notes plugin
Plug 'vim-scripts/utl.vim' " enhanced links

" integration with github gists
Plug 'mattn/webapi-vim' " dependency
Plug 'mattn/vim-gist' " integration with github gists

" git integration
Plug 'airblade/vim-gitgutter' " show git diff on the left side
Plug 'tpope/vim-fugitive' " :Git commands

" web dev
Plug 'mattn/emmet-vim' " html expansions

" programming general
let g:polyglot_disabled = ['notes', 'haskell']
Plug 'sheerun/vim-polyglot' " syntax highlighting for many languages
Plug 'lkdjiin/vim-foldcomments' " fold comments with :FoldComments
"Plug 'ycm-core/YouCompleteMe' " breaks a bunch of stuff

" language client (used by rust) " I don't really benefit from IDE stuff
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" haskell
Plug 'itchyny/vim-haskell-indent' " better indent as you type
Plug 'enomsg/vim-haskellConcealPlus' " conceal stuff
Plug 'idris-hackers/idris-vim' " integration with idris

" latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['tex', 'plaintex', 'lhaskell'] } " preview latex as you write it
Plug 'gerw/vim-latex-suite' " a bunch of stuff for latex writing

" julia
Plug 'JuliaEditorSupport/julia-vim' " unicode input and other stuff for julia

" factor
Plug 'brandonbloom/vim-factor'

if has('nvim')
" Plug 'github/copilot.vim' " requires pre-release version of neovim
else
endif
call plug#end()

" connect rust-analyzer to vim
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rust-analyzer'],
      \ }


" true color from xterm-256colors
" if (empty($TMUX))
" if (has("nvim"))
" "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
" "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
" if (has("termguicolors"))
" set termguicolors
" endif
" endif
" if exists('+termguicolors')
" set termguicolors
" endif

" automatic resizing settings
let g:lens#height_resize_min = 30
let g:lens#height_resize_max = 300
let g:lens#width_resize_min = 80
let g:lens#width_resize_max = 800

" Ctrl-F to visit note from other note
nnoremap <C-f> <C-w>vgf

" ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" spellchecking and spellcorrecting
"autocmd FileType markdown setlocal spell
"autocmd FileType tex setlocal spell
"autocmd FileType text setlocal spell
"set spelllang=en_us,bg
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" printer support
set printexpr=system(join([\"hp-print\",v:fname_in],\"\ \"))

" configure LaTeX preview
let g:livepreview_previewer = 'zathura'

" make FoldComments work
set foldmethod=marker
set foldmarker={{{,}}}
nnoremap <F6> :FoldComments<Enter>
nnoremap <F7> zE

" fix vim regex
" /[a] should match [a] and not a
" ^ and $ match start and end of line, but every other regex needs a \
set nomagic

" basic utl keybinding
nnoremap gu :Utl<Enter>

" AirLine settings
let g:airline_powerline_fonts=1
" autocmd VimEnter * AirlineToggleWhitespace

let mapleader = ","
set encoding=utf-8

" " YouCompleteMe
" let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
" " remove C from C++ linting (breaks autocompletion but eh)
" let g:ycm_filetype_blacklist = {
" \ 'tagbar': 1,
" \ 'notes': 1,
" \ 'markdown': 1,
" \ 'netrw': 1,
" \ 'unite': 1,
" \ 'text': 1,
" \ 'vimwiki': 1,
" \ 'pandoc': 1,
" \ 'infolog': 1,
" \ 'leaderf': 1,
" \ 'mail': 1,
" \ 'c': 1
" \}

" notes.vim settings
let g:notes_directories = ['~/notes']
autocmd FileType notes imap <buffer> -- --

" haskell-vim & vim-haskell-indent
let g:haskell_indent_disable = 1

" fix haskellConcealPlus
let hscoptions="A"

" agda-vim leader
let maplocalleader = "\\"

" map emmet leader to C-k
let g:user_emmet_leader_key='<C-k>'
" enable emmet only for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" enable AutoSave on Vim startup
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0
set noswapfile " disable .swp files (not needed because of autosave

" Keep the cursor in the middle on the screen
set scrolloff=99

" Make vim automatically reopen files that have changed on disk
set autoread

" Makes gvim look acceptable.
colorscheme wombat
set guifont=FiraCode
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" konsole lags due to these I guess
" set number relativenumber
set relativenumber

" konsole optimizations
set ttyfast
set lazyredraw

" Wrap lines by whole word
set linebreak

set undofile
set undodir=$HOME/.undodir//

set virtualedit=all

" Set tab size(s)
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"autocmd FileType nasm set tabstop=16
"autocmd FileType nasm set softtabstop=16
"autocmd FileType nasm set shiftwidth=16
"autocmd FileType forth set tabstop=8
"autocmd FileType forth set softtabstop=8
"autocmd FileType forth set shiftwidth=8

" .f means forth, not fortran
autocmd BufNewFile,BufRead *.f set ft=forth


" make tabs and extra spaces visible
" set list

syntax on

" governs how frequently vim updates the currently opened file.
set updatetime=100

" stuff I copy-pasted from the internet. It's something about the info line or
" something
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" custom assembly syntax highlighting
filetype on
autocmd BufNewFile,BufRead *.asm set ft=fasm
" autocmd FIleType nasm call AssemblyConfig()
function AssemblyConfig()
setlocal softtabstop=8
setlocal tabstop=8
setlocal noexpandtab
retab
endfunction

" compile/run code with F8
" [deleted because the mappings were absolutely terrible]

" racket stuff
" autocmd FileType racket map <F8> :w<CR>:!chcp 65001 & racket "%"<CR>
" if has("autocmd")
"    au BufReadPost *.rkt,*.rktl set filetype=racket
"    au filetype racket set lisp
"    au filetype racket set autoindent
" endif

"Remove all trailing whitespace by pressing F5
"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>gg=G<C-o><C-o>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" quick copy
nnoremap <Leader>y "+y$j

" typos tolerance
cabbr WQ wq
cabbr Wq wq
cabbr W w
cabbr Q q
cabbr Q! q!
cabbr Qa qa

" disable airline trailing space error
"let g:airline#extensions#whitespace#checks = []

" Remap arrow keys in normal mode
" noremap <Up> :resize -1<CR>
" noremap <Down> :resize +1<CR>
" noremap <Left> :vertical resize -3<CR>
" noremap <Right> :vertical resize +3<CR>

" Remap ; to work as :
nnoremap ; :

" ctrl+c to clear search
nnoremap <C-c> :let @/=""<CR>

" case insensitive search
set ignorecase
set smartcase

if has('nvim') " neovim boilerplate
set guicursor=
" for easymotion
autocmd OptionSet guicursor noautocmd set guicursor=

endif

" --- Latex-Suite stuff ---

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" --- end of latex-suite stuff ---
