# Set Up a Productive Windows Development Environment

This repository is designed to streamline the configuration process and provide easy installation instructions for creating an opinionated development environment on your Windows machine.

You'll also find example backup configuration files and a list of mundane tasks for setting up a new development environment.

## Automated installation of essential applications with `winget`

Use `winget` (Microsoft's package manager) to streamline the installation of essential applications for Windows.
The `winget import` command allows you to automate the installation process of multiple applications by providing a predefined list in a JSON file.
The repository provides a predefined list of popular applications in `winget.json` to make the setup process easier.

1. Install `winget` from the [Microsoft Store](https://www.microsoft.com/p/app-installer/9nblggh4nns1#activetab=pivot:overviewtab)
2. Install applications using `winget import`.

    ```powershell
    winget import winget.json
    ```

## Customize Windows Terminal and Shell for Development Productivity

![image](https://user-images.githubusercontent.com/1017451/189543010-9057108a-0507-472f-b98c-d6019a0fe5b0.png)

1. [Install nerd fonts](https://github.com/ryanoasis/nerd-fonts)

    ```powershell
    iwr -useb get.scoop.sh | iex;
    scoop bucket add nerd-fonts;
    scoop install Hack-NF;
    ```

2. Install shell customization tools

    * [z](https://github.com/badmotorfinger/z) - quickly navigate the file system
    * [TerminalIcons](https://github.com/devblackops/Terminal-Icons) or [lsd](https://github.com/lsd-rs/lsd) - upgrade the ls view
    * [JanDeDobbeleer.OhMyPosh](https://ohmyposh.dev/) - themes for shell
    * [PSReadLine](https://github.com/PowerShell/PSReadLine) - upgrades the command line with features like shortcuts or syntax highlighting
    * [posh-git](https://github.com/dahlbyk/posh-git) - git status and git commands tab completion

    As administrator run the following:

    ```powershell
    Install-Module -Name z;
    Install-Module -Name Terminal-Icons -Repository PSGallery;
    scoop install lsd
    Install-Module PSReadLine;
    Install-Module posh-git;
    ```

3. Update your PowerShell profile to [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1)

    ```powershell
    code $PROFILE
    ```

    [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1) configures and customizes the behavior of the PSReadLine module in Windows Terminal for PowerShell.
    It also defines several functions and aliases for various tasks and utilities.

4. Set display font to `Hack Nerd Font` in:
    1. Visual Studio Code <https://ohmyposh.dev/docs/installation/fonts>
    2. Windows Terminal <https://ohmyposh.dev/docs/installation/fonts>
    3. JetBrains IDE: File -> Settings -> Editor -> Colors & Fonts -> Console Font.

## Git config

1. [Automatically stash and pop pending changes when using "git pull"](https://stackoverflow.com/a/30209750/1219811)

    Simplifies workflow when pulling changes

    ```powershell
    git config --global pull.rebase true;
    git config --global rebase.autoStash true;
    ```

2. [Automatically set upstream when using "git push"](https://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time)

    Simplifies workflow when pushing a branch for the first time

    ```powershell
    git config --global push.default current
    ```

3. [Set default git editor](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

    An example command that sets up Visual Studio Code as a default git editor.

    ```powershell
    git config --global core.editor "code"
    ```

4. Set username and email

    ```powershell
    git config --global user.email "";
    git config --global user.name "";
    ```

5. [Globally ignore files](https://stackoverflow.com/questions/7335420/global-git-ignore)

    Enable global .gitignore file

    ```powershell
    git config --global core.excludesfile ~/.gitignore
    ```

    Then create the .gitignore file.

    ```powershell
    code "$env:USERPROFILE/.gitignore"
    ```

    The contents may vary by your IDEs and tools used. [GitHub's collection of templates to use globally](https://github.com/github/gitignore/tree/main/Global). Below is an example configuration.

    ```txt
    .idea/
    .code/
    ```

6. Autocorrect spelling mistakes

    ```powershell
    git config --global help.autocorrect 30
    ```

## Block distracting websites

You can redirect time-wasting sites to a non-existent or restricted IP address. This technique helps enhance productivity by reducing the temptation to visit time-wasting or distracting online platforms.

1. Open `hosts` file

    ```powershell
    code C:\Windows\System32\drivers\etc\hosts
    ```

2. Then update the contents to the [attached example](hosts)

## Docker on Windows Subsystem for Linux (WSL)

1. [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command) (run as administrator)

    ```powershell
    wsl --install
    ```

2. To improve performance, adjust the amount of memory and processors used by updating the `.wslconfig` file.

    ```powershell
    code "$env:USERPROFILE/.wslconfig"
    ```

3. [Install docker and docker compose at wsl](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

## Git hooks

This repository contains Git hooks that automate tasks during different stages of development.
To use the Git hooks in your environment, copy the files from [hooks](git/hooks) to the `.git/hooks/` directory in your project.

### Pre-commit git hook

The pre-commit git hook helps automate repetitive tasks before each commit in .net projects. The hook performs the following actions:

1. Runs `dotnet build` to ensure that the code compiles.
2. Executes `dotnet test` to ensure that tests pass.
3. Formats changed `.cs` files using `dotnet format`.

### Post-merge git hook

The post-merge git hook updates npm dependencies by running npm install after `git pull` when it detects any change in any `package-lock.json` in a repository.

### Prepare-commit-msg git hook

The prepare-commit-msg hook is invoked before the commit message is finalized. In this repository, the prepare-commit-msg hook automatically adds the issue tracker number to the beginning of the commit message if the branch name contains numbers.