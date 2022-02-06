#
# fzf configuration
#

#
# git ls-tree for fast traversal
# If you're running fzf in a large git repository, git ls-tree can boost up the speed of the traversal.
#
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'


export FZF_DEFAULT_OPTS="\
        --exact                          \
        --height ${FZF_TMUX_HEIGHT:-30%} \
        --bind 'shift-tab:up,tab:down'   \
        --layout=reverse --border        \
        --info=hidden                    \
        --prompt='$  '                   \
        --pointer='=>'                   \
        --marker='+'                     \
        --cycle                          \
        --select-1                       \
        --color=dark                     \
        --color=fg:-1,bg:-1,hl:#fb8aa4,fg+:-1,bg+:-1,hl+:#55E579 \
        --color=info:#af87ff,prompt:#fb8aa4,pointer:#55E579,marker:#55E579,spinner:#55E579
        "

