
choco upgrade chocolatey
choco feature enable -n allowGlobalConfirmation

# pwsh
choco install powershell-core
choco install microsoft-windows-terminal
choco install powershell.portable
choco install oh-my-posh
choco install poshgit
choco install cascadia-code-nerd-font
choco install terminal-icons.powershell


Installation:
    (from a new Powershell7 admin window run)

    Install-Module posh-git -Scope CurrentUser
    Install-Module oh-my-posh -Scope CurrentUser
    Install-Module -Name Terminal-Icons -Repository PSGallery
    Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck


    Install-Module zlocation -Scope CurrentUser
    Install-Module PSFzf -Scope CurrentUser

    if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
    notepad $PROFILE
    (copy https://raw.githubusercontent.com/pablospe/dotfiles/master/powershell/Microsoft.PowerShell_profile.ps1)


-------------------------------------

Otherwise follow installation of `oh-my-posh`:

    https://github.com/JanDeDobbeleer/oh-my-posh
