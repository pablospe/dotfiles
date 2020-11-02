Installation:

    Install-Module posh-git -Scope CurrentUser
    Install-Module oh-my-posh -Scope CurrentUser
    Install-Module zlocation -Scope CurrentUser
    Install-Module PSFzf -Scope CurrentUser    
    if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
    notepad $PROFILE
    (copy https://raw.githubusercontent.com/pablospe/dotfiles/master/powershell/Microsoft.PowerShell_profile.ps1)


Otherwise follow installation of `oh-my-posh`:

    https://github.com/JanDeDobbeleer/oh-my-posh
    

