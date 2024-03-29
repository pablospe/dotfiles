cd $HOME

#
# oh-my-posh
#
# https://github.com/JanDeDobbeleer/oh-my-posh#configuration
Import-Module posh-git
Import-Module oh-my-posh

# ZLocation is similar to autojump
#
# 'z' will take you to the most popular directory that matches all of the
# regular expressions given on the command line
#
# https://github.com/vors/ZLocation
Import-Module ZLocation

#
# Enable the prompt
#
Set-PoshPrompt -Theme Paradox
# Set-PoshPrompt -Theme Avit
# Set-PoshPrompt -Theme Sorin
# Set-PoshPrompt -Theme Zash
# Set-PoshPrompt -Theme Operator

#
# Fuzzy search
#
Import-Module PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$Env:FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

$Env:FZF_DEFAULT_OPTS="--exact --border --height 15 --layout=reverse --info=hidden --prompt='$' --pointer='=>' --marker='+' --cycle --select-1 --color=dark --bind '?:toggle-preview,ctrl-a:select-all,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-l:clear-query,home:first,end:last,enter:accept-non-empty' --color=fg:-1,bg:-1,hl:#fb8aa4,fg+:-1,bg+:-1,hl+:#55E579 --color=info:#af87ff,prompt:#fb8aa4,pointer:#55E579,marker:#55E579,spinner:#55E579"

$Env:FZF_CTRL_R_OPTS="--with-nth 2.. --bind 'shift-tab:up,tab:down'"


# CTRL + D to exit
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

# remove word with Alt+backspacek
Set-PSReadLineKeyHandler -Key Alt+backspace -Function BackwardKillWord

#
# CTRL+p and CTRL+n let you search previous commands, also partiarlly filled:
#    > vim <CTRL+p>      (previous commands starting with "vim ")
#
Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward

#
# CTRL+u  (also <ESC> delete current line)
#
Set-PSReadLineKeyHandler -Key Ctrl+u -Function DeleteLine

# Enable-PsFzfAliases  (slow)
# "fz"      Invoke-FuzzyZLocation

#
# ColorTool
#
# https://github.com/dracula/powershell/blob/master/theme/dracula-prompt-configuration.ps1
#
# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
#
Set-PSReadlineOption -Color @{
    "Command"   = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator"  = [ConsoleColor]::Magenta
    "Variable"  = [ConsoleColor]::White
    "String"    = [ConsoleColor]::Yellow
    "Number"    = [ConsoleColor]::Blue
    "Type"      = [ConsoleColor]::Cyan
    "Comment"   = [ConsoleColor]::DarkCyan
}


#########
# Aliases
#########

# ls
Set-Alias -Name l -Value ls
Set-Alias -Name ll -Value ls

#
# "op" -> alias to open files with default programs. Examples:
#
#    > op .         (open explorer in the current folder)
#    > op file.py   (open `file.py` in the default editor)
#
New-Alias op explorer.exe


#
# Complete like bash (instead of first result)
#
# https://stackoverflow.com/questions/8264655/how-to-make-powershell-tab-completion-work-like-bash/37715242#37715242
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# PSFzf can replace the standard tab completion:
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Disable PowerShell beep
Set-PSReadlineOption -BellStyle None

# Icons
Import-Module -Name Terminal-Icons
