"" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.vim/plugged')


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ryanoasis/vim-devicons'

" Color scheme
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'

" NerdTree with git status
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'easymotion/vim-easymotion'

"Plug 'yuttie/comfortable-motion.vim'

Plug 'ntpeters/vim-better-whitespace'

"Plug 'tpope/vim-repeat'

"Plug 'wellle/targets.vim'

Plug 'vim-scripts/restore_view.vim'

"Plug 'valloric/matchtagalways'


Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" tmux: seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
"
" Plug 'zxqfl/tabnine-vim'

" Python
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

" Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" Collection of awesome color schemes for Vim
Plug 'rafi/awesome-vim-colorschemes'


" Invasive
""
"" Tabs
""Plug 'ap/vim-buftabline'
Plug 'zefei/vim-wintabs'
"Plug 'zefei/vim-wintabs-powerline'

"" Sessions
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'


"Plug 'svermeulen/vim-easyclip'

" Highlight your yank aera
Plug 'machakann/vim-highlightedyank'

" Highlight current work
Plug 'dominikduda/vim_current_word'

" Ctrl+N for multiple cursors (Ctrl+X for skip)"
" Plug 'terryma/vim-multiple-cursors'

Plug 'fisadev/dragvisuals.vim'

" Plug 'psliwka/vim-smoothie'

Plug 'tadaa/vimade'

" Initialize plugin system
call plug#end()

