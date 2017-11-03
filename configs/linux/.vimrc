"Author: Mike Buciuman-Coman
"Updated 2016

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" removes splash screen on boot
set shortmess+=I

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup " do not keep a backup file, use versions instead
else
    set backup " keep a backup file
endif
set history=50 " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set ignorecase " ignore search term case
set smartcase " use smart search term casing (NOT SURE IF OVERWRITING PREV LINE)
set wrap " enable wrapping
set linebreak " wrap at a space, period, etc.
" set formatoptions=l " not sure what this does
set nolist  " list disables linebreak

" Add new lines in normal mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Add smart functions to parentheses/brackets/braces TODO: Remove since I have a plugin
" inoremap {<Tab> {<CR>}<Esc>O
" inoremap (<CR> (<CR>)<Esc>O
" inoremap {<CR> {<CR>}<Esc>O
" inoremap {; {<CR>};<Esc>O
" inoremap {, {<CR>},<Esc>O
" inoremap [<CR> [<CR>]<Esc>O
" inoremap [; [<CR>];<Esc>O
" inoremap [, [<CR>],<Esc>O

" Removes trailing spaces
nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" change backup and swp file directories
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

" line movement options (Doesn't work in Windows)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>=
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
" if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent
"indenting.

" else

" set autoindent" always set autoindenting on

" endif " has("autocmd")

" set smartindent

" Convenient command to see the difference between the current buffer and the file it was loaded from, thus the changes you made. Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ |
    diffthis
                \ | wincmd p | diffthis
endif

" Sets up line number displayed over relative line number (so line number shows up over the relative number's 0)
"set relativenumber
set number

" Loads helptags (apparently not)
" Helptags

" Enables pathogen plugin loader
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
filetype plugin on

" vim-airline config lines
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#syntastic#enabled = 0
let g:airline_powerline_fonts = 1
set encoding=utf-8
set laststatus=2
" set statusline+=%warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let form_enhanced_color=1
" set guifont=Cousine\ for\ Powerline\ 12px
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12px
" set antialias
let g:airline_theme='badwolf'
colorscheme badwolf

" let g:colorscheme_switcher_exclude = ['default', 'test']
" let g:colorscheme_switcher_exclude_builtins = 1
" let g:colorscheme_switcher_keep_background = 1

" Indent settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set tabstop=4
set shiftwidth=4
set expandtab
"nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
"

" Keybind to show whitespace
" nmap <F3> <Plug>ShowWhiteToggle

" TODO: find out why I put this here (maybe auto-bracket)
" inoremap { {<CR>}<Esc>known

" Fullscreen keybind
" map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Remove GVIM Menu UI
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll BottomLeftQuadrant

" Set search highlighting on
set hlsearch

" Set leader character to ','
let mapleader=","

" Tagbar toggle (not using anymore)
" nmap <F5> :TagbarToggle<CR>
" let g:tagbar_autoclose = 1

" Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" syn region csFold start="{" end="}" transparent fold

" auto-fold .cs files using their syntax
" autocmd BufNewFile,BufRead *.cs set foldmethod=syntax

" CTRL-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" TODO: cygwin bash integration
" map <C-Left> :bp<CR>
" set shell=C:\Cygwin\bin\bash.exe\ -login
" set shellcmdflag=-c
" set shellquote=\"

" quick editing and sourcing .vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" TODO: F11 opens current file in explorer
" nmap <F11> :!start explorer /e,,%:p:h<CR>
" imap <F11> <Esc><F11>

" TODO: cygwin + putty vim integration
" let g:netrw_cygwin = 0
" let g:netrw_ssh_cmd  = '"C:\Program Files
" (x86)\PuTTY\plink.exe" -batch -T -ssh'
" let g:netrw_scp_cmd  = '"C:\Program Files
" (x86)\PuTTY\pscp.exe"  -batch -q -scp'
" let g:netrw_sftp_cmd = '"C:\Program Files
" (x86)\PuTTY\pscp.exe"  -batch -q -sftp'

" tab / buffer navigation shortcuts
map <C-S-Left> :tabp<CR>
map <C-S-Right> :tabn<CR>
map <C-Left> :bp<CR>
map <C-Right> :bn<CR>

" Untab in insert mode
inoremap <S-Tab> <C-d>

" Copy to X CLIPBOARD
map <leader>cb :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <leader>pb :r!xsel -b<CR>
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>

" Reload syntax highlighting
map <leader>rsyn :syntax sync fromstart<CR>

" Add new lines in normal mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" removes trailing whitespace and changes all tabs to spaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>:ret<CR>
" :command! -nargs=2 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" syntax- :Run <bash_command>
" command -nargs=+ Run :cexpr system('<args>') | copen

" autoformat on save
"au BufWritePost * :Autoformat
"let g:easytags_events = ['BufWritePost']
"let g:easytags_async = 0

"double click to highlight all words
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

"close buffer without window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>.

