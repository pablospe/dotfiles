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
