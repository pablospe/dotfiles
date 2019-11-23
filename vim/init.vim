source ~/.vim/plugins.vim

let mapleader = "\<space>"

set encoding=UTF-8

" clipboard
" vim --version | grep .xterm_clipboard -o
" (otherwise install: "sudo apt install vim-gnome")
set clipboard=unnamedplus

" mouse
set mouse=a

" common directory for swap files
set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/swapfiles//

syntax on
colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
set background=dark " use dark mode
" set background=light " uncomment to use light mode
"let as g:gruvbox_contrast_dark='soft'
"let as g:gruvbox_contrast_dark='hard'
"let as g:airline_theme='soda'
"let as g:airline_theme='luna'
"let a g:airline_theme='deus'
"let g:airline_theme='bubblegum'

" set colorcolumn=80
let &colorcolumn = join(range(81,999), ',')

nmap <Leader>o :NERDTreeToggle<CR>
nmap <Leader>q :q<CR>
nmap <Leader>! :q!<CR>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
nmap <Leader>r :Rg <UP>
nmap <Leader>\ :vsplit<CR>

"nmap <C-h> viw

imap kk <ESC>k
imap jj <ESC>j

" Go from one buffer to another without needing to save first
set hidden

let g:vim_current_word#highlight_delay = 0
hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=237
autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1
nmap <Leader>h :VimCurrentWordToggle<CR>

let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1
" Default highlighting (see help :highlight and help :highlight-link)
"highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
"highlight link multiple_cursors_visual Visual


"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
"let g:comfortable_motion_friction = 100.0
"let g:comfortable_motion_air_drag = 0.0
"let g:comfortable_motion_friction = 0.0
"let g:comfortable_motion_air_drag = 4.0

" vim-better-whitespace
" Trim whitespaces when save (only on modified lines)
" Use :StripWhitespace for full file
let g:better_whitespace_enabled=1
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1

"if has('persistent_undo')      "check if your vim version supports it
set undofile                " turn on the feature
set undodir=$HOME/.vim/undo " directory where the undo files will be stored
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
"endif

set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']

nnoremap <leader>% :MtaJumpToOtherTag<cr>


" Invasive


" Can I disable continuation of comments to the next line in Vim?
"     https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
au FileType c,cpp setlocal comments-=:// comments+=f://


let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=1
map  <Leader>n  :NERDTreeFind<CR>   " Find the location of current file



"set clipboard=unnamed
"nnoremap gm m
"nmap <leader>cf <plug>EasyClipToggleFormattedPaste
"imap <c-v> <plug>EasyClipInsertModePaste
"cmap <c-v> <plug>EasyClipCommandModePaste

" Wintabs
"map <C-H> <Plug>(wintabs_previous)
"map <C-L> <Plug>(wintabs_next)
" noremap <C-[> <Plug>(wintabs_previous)
" noremap <C-]> <Plug>(wintabs_next)
" map <C-T>c <Plug>(wintabs_close)
" map <C-T>u <Plug>(wintabs_undo)
" map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close)
map <C-W>u <Plug>(wintabs_undo)
map <C-W>o <Plug>(wintabs_only)

map <C-W>h <Plug>(wintabs_previous)
map <C-W>l <Plug>(wintabs_next)
map <C-W><C-H> <Plug>(wintabs_previous)
map <C-W><C-L> <Plug>(wintabs_next)

command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

" Wintabs: US Intl Alt-gr keyboard (alt-gr+j and alt-gr+k)
map ï <Plug>(wintabs_previous)
imap ï <ESC><Plug>(wintabs_previous)
map œ <Plug>(wintabs_next)
imap œ <ESC><Plug>(wintabs_next)

" Neovim
map <a-j> <Plug>(wintabs_previous)
map <a-k> <Plug>(wintabs_next)
"noremap ^[j <Plug>(wintabs_previous)
"noremap ^[k <Plug>(wintabs_next)


source ~/.vim/fzf.vim

source ~/.vim/local.vim
