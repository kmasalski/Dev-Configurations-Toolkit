# Dev tools and configs

*Please note that the guide reflects my preferences and practices that work well for me.*

This repository stores configurations and installation instructions with an aim
to create the development environment on your Windows machine.

As well,
you can find here example backup of configuration files and list of mundane tasks
that should be performed on a new developer machine.

## Default applications

Use `winget` (Microsoft's package manager) to streamline the installation of essential applications for
Windows.
The repository provides a predefined list of popular applications in `winget.json` to make the setup process
easier.

1. Install `winget`
   from [Microsoft Store](https://www.microsoft.com/p/app-installer/9nblggh4nns1#activetab=pivot:overviewtab)
2. Install applications using `winget import`.

    ```powershell
   winget import winget.json
   ```

## Customize Windows terminal and shell

![image](https://user-images.githubusercontent.com/1017451/189543010-9057108a-0507-472f-b98c-d6019a0fe5b0.png)

1. [Install nerd fonts](https://github.com/ryanoasis/nerd-fonts)

    ```powershell
    iwr -useb get.scoop.sh | iex; scoop bucket add nerd-fonts; scoop install Cascadia-Code
    ```

2. Install shell customization tools

    * [z](https://github.com/badmotorfinger/z) - quickly navigate the file system
    * [lsd](https://github.com/devblackops/Terminal-Icons) or [TerminalIcons](https://github.com/lsd-rs/lsd) - upgrade
      the ls view
    * [JanDeDobbeleer.OhMyPosh](https://ohmyposh.dev/) - themes for shell
    * [PSReadLine](https://github.com/PowerShell/PSReadLine) - upgrades the command line with features like shortcuts or
      syntax highlighting
    * [posh-git](https://github.com/dahlbyk/posh-git) - git status and git commands tab completion

    ```powershell
    Install-Module -Name z;
    Install-Module -Name Terminal-Icons -Repository PSGallery;
    scoop install lsd
    winget install JanDeDobbeleer.OhMyPosh -s winget;
    Install-Module PSReadLine;
    Install-Module posh-git;
    ```

3. Update your PowerShell profile to [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1)
    ```powershell
    code $PROFILE
    ```
   [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1) configures and customizes the behavior of the
   PSReadLine module in Windows Terminal for PowerShell.
   It also defines several functions and aliases for various tasks and utilities.

## Git config

1. [Automatically stash and pop pending changes when using "git pull"](https://stackoverflow.com/a/30209750/1219811)

   Simplifies workflow when pulling changes
    ```powershell
    git config --global pull.rebase true; git config --global rebase.autoStash true
    ```

2. [Automatically set upstream when using "git push"](https://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time)

   Simplifies workflow when pushing a branch for the first time
    ```powershell
    git config --global push.default current
    ```

3. [Set default git editor](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

   Example script that set up Visual Studio Code as a default git editor.
    ```powershell
    git config --global core.editor "code"
    ```

4. Set username and email

    ```powershell
    git config --global user.email ""
    git config --global user.name ""
    ```

## Docker on WSL

1. [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command) (run as administrator)

    ```powershell
    wsl --install
    ```

2. Increase available resources (amount of memory or processors used)

    ```powershell
    code "$env:USERPROFILE/.wslconfig"
    ```

3. [Install docker and docker compose at wsl](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
