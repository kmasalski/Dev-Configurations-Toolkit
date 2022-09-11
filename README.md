# Dev tools and configs

## Docker on WSL

1. [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command) (run as administrator)

    ```powershell
    wsl --install
    ```

1. Increase available resources

    ```powershell
    notepad "$env:USERPROFILE/.wslconfig"
    ```

1. [install docker and docker compose](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

## Default applications

1. Install winget from msstore
1. Install default applications

    ```powershell
    Invoke-WebRequest "https://raw.githubusercontent.com/kmasalski/tools/main/winget.json" -OutFile winget.json
    winget import winget.json
    ```

## Customize Windows terminal and shell

1. [Install nerd fonts](https://github.com/ryanoasis/nerd-fonts)

    ```
    cd nerd-fonts
    ./install.ps1 CascadiaCode
    ```
1. Install shell customization tools

    ```powershell
    Install-Module -Name Terminal-Icons -Repository PSGallery
    Install-Module -Name PowerShellGet -Force
    Install-Module PSReadLine -AllowPrerelease -Force
    Install-Module -Name z
    ```

1. Install OhMyPosh

    ```powershell
    winget install JanDeDobbeleer.OhMyPosh -s winget
    ```

1. Update powershell profile to

    ```powershell
    $tools = (Invoke-WebRequest "https://raw.githubusercontent.com/kmasalski/tools/main/Microsoft.PowerShell_profile.ps1")
    Invoke-Expression($tools.Content)
    ```

1. or copy contents of `Microsoft.PowerShell_profile.ps1` to your profile file

## Git config

1. [Automatically stash and pop pending changes when using "git pull"](https://stackoverflow.com/a/30209750/1219811)

    ```powershell
    git config --global pull.rebase true
    git config --global rebase.autoStash true
    ```

1. [Automatically set uptream when using "git push"](https://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time)

    ```powershell
    git config --global push.default current
    ```

1. [Set default git editor](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

    ```powershell
    git config --global core.editor "code"
    ```

1. Set user name and email

    ```powershell
    git config --global user.email ""
    git config --global user.name ""
    ```
