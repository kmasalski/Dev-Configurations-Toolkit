# Dev tools and configs

## Docker on WSL

1. To [install WSL](https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command) run as administrator

    ```powershell
    wsl --install
    ```

1. then increase available resources

    ```powershell
    notepad "$env:USERPROFILE/.wslconfig"
    ```

1. [install docker and docker compose](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

## Applications

Install winget from msstore

```powershell
Invoke-WebRequest "https://raw.githubusercontent.com/kmasalski/tools/main/winget.json" -OutFile winget.json
winget import winget.json
```

## Customize Windows terminal and shell

[Install nerd fonts](https://github.com/ryanoasis/nerd-fonts)

cd nerd-fonts
./install.ps1 CascadiaCode

### Shell customization

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module -Name z
```

#### OhMyPosh

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

#### Update powershell profile to

```powershell
$tools = (Invoke-WebRequest "https://raw.githubusercontent.com/kmasalski/tools/main/Microsoft.PowerShell_profile.ps1")
Invoke-Expression($tools.Content)
```

or copy contents of `Microsoft.PowerShell_profile.ps1`

## Git config

["git pull" automatically stash and pop pending changes](https://stackoverflow.com/a/30209750/1219811)

```powershell
git config --global pull.rebase true
git config --global rebase.autoStash true
```

["git push" automatically set uptream](https://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time)

```powershell
git config --global push.default current
```

[Default git editor](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

```powershell
git config --global core.editor "code"
```

User name and email

```powershell
git config --global user.email ""
git config --global user.name ""
```
