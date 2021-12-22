set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


 "Indent Guides (disable)
"let indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=237
"let indent_guides_color_change_percent = 10
"let indent_guides_guide_size = 1


map <F8> :set nohls!<CR>
imap <F8> <ESC>:set nohls!<CR>a


" Shortcut to rapidly toggle `set list`
"scriptencoding utf-8
"set encoding=utf-8
"nmap <leader>l :set list!<CR>
"set list listchars=tab:»·,trail:·
set list
set listchars=tab:»-,trail:·,extends:>,precedes:<

" Set vim bracket highlighting colors
hi MatchParen cterm=bold ctermbg=none ctermfg=120


" Easymotion:
let g:EasyMotion_keys = 'asdfqwerzxcvlkjpoiumhytgb'
map  <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Incremental search (+ fuzzy)
set hlsearch
set ignorecase
set smartcase

map /  <Plug>(incsearch-forward)
map <Leader>g/ <Plug>(incsearch-stay)
map <Leader>?  <Plug>(incsearch-backward)

map <Leader><Leader>/ <Plug>(incsearch-fuzzy-/)
map <Leader><Leader>? <Plug>(incsearch-fuzzy-?)
"let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)


" Toggle spelling visuals with <leader>s
nnoremap <leader>s :set spell!<CR>
set nospell


" Right behaviour when wrap
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> <F10> :set wrap!<CR>
inoremap <silent> <F10> <ESC>:set wrap!<CR>a


" ENTER: enter to insert mode
" nnoremap <silent> <CR> a<CR>

" BackSpace: enter to insert mode
noremap <BS> i<BS>
vnoremap <BS> x<ESC>

" Ctrl+S: saves the content
noremap <C-S> <Esc>:w <CR>
inoremap <C-S> <Esc>:w <CR>a

" Ctrl+A: select all
noremap <C-A> ggVG
inoremap <C-A> <Esc>ggVG

" Ctrl+C: copy using System Clipboard
vnoremap <C-c> "+y<CR>

" Ctrl+Q: quit
noremap <C-Q> <Esc>:q <CR>
inoremap <C-Q> <Esc>:q <CR>

" Undo
map <C-z> u
imap <C-z> <ESC>u<ESC>h<ESC>a

" Remain in visual mode after indenting selection
" Remember: == to auto-indent. 5== to auto-indent 5 lines
vnoremap < <gv
vnoremap > >gv

" indent with Tab
" nnoremap <Tab> >>
nnoremap <S-Tab> <<"
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <S-Tab> <C-d>


" Mappings to move lines.
" nnoremap <silent><C-j> :m .+1<CR>==
" nnoremap <silent><C-k> :m .-2<CR>==
" vnoremap <silent><C-j> :m '>+1<CR>gv=gv
" vnoremap <silent><C-k> :m '<-2<CR>gv=gv
" inoremap <silent><C-j> <Esc>:m .+1<CR>==gi
" inoremap <silent><C-k> <Esc>:m .-2<CR>==gi


" Move lines with Alt+j|k (it works in Neovim)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Easier horizontal scrolling
map zl zL
map zh zH


set number                     " Show current line number
set relativenumber             " Show relative line numbers
autocmd InsertLeave * :set relativenumber
autocmd InsertEnter * :set norelativenumber

function! NumberToggle()
    if(&number == 1 && &relativenumber == 1)
        set number!
        set relativenumber!
    elseif(&number == 0 && &relativenumber == 0)
        set relativenumber
        set number
    else
        set number!
    endif
endfunction

nnoremap <silent> <F11> :call NumberToggle()<CR>
inoremap <silent> <F11> <ESC>:call NumberToggle()<CR>i


" set colorcolumn=80
let &colorcolumn = join(range(81,999), ',')

" Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=237 ctermfg=none
hi CursorLineNr ctermbg=53

autocmd WinEnter * setlocal relativenumber
autocmd WinEnter *
  \ let &colorcolumn = join(range(81,999), ',')
autocmd WinLeave *  setlocal norelativenumber colorcolumn=0

" fade inactive windows
" let g:vimade = {}
" let g:vimade.fadelevel = 0.5
" let g:vimade.enablesigns = 1


" Quote a word consisting of letters from iskeyword.
" Note:  http://vim.wikia.com/wiki/Simple_Macros_to_quote_and_unquote_a_word
nnoremap <silent> qw :call Quote('"')<CR>
nnoremap <silent> qs :call Quote("'")<CR>
"nnoremap <silent> wq :call UnQuote()<CR>
function! Quote(quote)
  normal mz
  exe 's/\(\k*\%#\k*\)/' . a:quote . '\1' . a:quote . '/'
  normal `zl
endfunction

function! UnQuote()
  normal mz
  exe 's/["' . "'" . ']\(\k*\%#\k*\)[' . "'" . '"]/\1/'
  normal `z
endfunction

nmap <Leader>" qw
nmap <Leader>' qs
vnoremap <Leader>" c"<C-r>""<Esc>
vnoremap <Leader>' c'<C-r>"'<Esc>

" Toggle comments (Ctrl+/)
nmap  <Leader>c<Space>
imap  <ESC><Leader>c<Space>a
vmap  <Leader>c<Space>gv

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"
" https://superuser.com/questions/1190190/switch-colorscheme-in-terminal-vim-and-tmux-front-dark-to-light-with-one-comman
"
function! Color_scheme_swap()
    if &background ==? 'dark'
        let g:solarized_termcolors=256
        colorscheme solarized
        set background=light
        hi CurrentWord ctermbg=155
        hi CurrentWordTwins ctermbg=150
        " execute "silent !tmux source-file " . shellescape(expand('~/tmux-colors-solarized/tmuxcolors-light.conf'))
    else
        colorscheme gruvbox
        set background=dark
        hi CurrentWord ctermbg=53
        hi CurrentWordTwins ctermbg=237
        hi CursorLineNr ctermbg=53
        " execute "silent !tmux source-file " . shellescape(expand('~/tmux-colors-solarized/tmuxcolors-dark.conf'))
    endif
    " silent !osascript -e 'tell app "System Events" to keystroke "s" using {shift down, option down, control down}'
endfunction

command! ColorSchemeSwap call Color_scheme_swap()
nnoremap <silent> <Leader>i :ColorSchemeSwap<CR>
vnoremap <silent> <Leader>i <ESC>:ColorSchemeSwap<CR>gv

" DragVisual
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1


"------------------------------------------------------------------------------
" vim-signature
"------------------------------------------------------------------------------

" map <Ctrl+PgUp> and <Ctrl+PgDown> to jump previous and next mark
map <C-PageUp>   [`
map <C-PageDown> ]`

"------------------------------------------------------------------------------
" slime configuration (needed for ipython-cell plugin)
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" don't use defualt slime mappings
let g:slime_no_mappings = 1

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Use '# %%' to define cells
let g:ipython_cell_delimit_cells_by = 'tags'
let g:ipython_cell_tag = "# %%"

" default slime mapping but only for python
autocmd FileType python xmap <c-c><c-c> <Plug>SlimeRegionSend
autocmd FileType python nmap <c-c><c-c> <Plug>SlimeParagraphSend
autocmd FileType python nmap <c-c>v <Plug>SlimeConfig

" map <F9> to send the current line or current selection to IPython
autocmd FileType python xmap <F9> <Plug>SlimeRegionSend
autocmd FileType python nmap <F9> <Plug>SlimeParagraphSend

" map <F5> to save and run script
autocmd FileType python nnoremap <F5> :w<CR>:IPythonCellRun<CR>
autocmd FileType python inoremap <F5> <C-o>:w<CR><C-o>:IPythonCellRun<CR>

" map <F6> to evaluate current cell without saving
autocmd FileType python nnoremap <F6> :IPythonCellExecuteCell<CR>
autocmd FileType python inoremap <F6> <C-o>:IPythonCellExecuteCell<CR>

" map <F7> to evaluate current cell and jump to next one without saving
autocmd FileType python nnoremap <F7> :IPythonCellExecuteCellJump<CR>
autocmd FileType python inoremap <F7> <C-o>:IPythonCellExecuteCellJump<CR>

" map [c and ]c to jump to the previous and next cell header
autocmd FileType python nnoremap [c :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap ]c :IPythonCellNextCell<CR>

" map <Ctrl+Enter> to evaluate current cell without saving
autocmd FileType python nnoremap  :IPythonCellExecuteCell<CR>
" autocmd FileType python inoremap  <C-o>:IPythonCellExecuteCell<CR>

" map <Shitf+Enter> to evaluate current cell and jump to next one without saving
autocmd FileType python nnoremap OM :IPythonCellExecuteCellJump<CR>
autocmd FileType python inoremap OM <C-o>:IPythonCellExecuteCellJump<CR>

" map Ctrl+Up and Ctrl+Down
autocmd FileType python nnoremap [1;5A :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap [1;5B :IPythonCellNextCell<CR>

