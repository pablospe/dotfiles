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
Set-Prompt
Set-Theme Paradox
# Set-Theme Avit
# Set-Theme Sorin
# Set-Theme Zash
# Set-Theme Operator

#
# Fuzzy search
#
Import-Module PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

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
