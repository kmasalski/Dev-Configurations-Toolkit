# https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command
# install wsl; in powershell admin"
wsl --install

# increase available resources
notepad "$env:USERPROFILE/.wslconfig"

# install docker and docker compose; in ubuntu:
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# todo nerd fonts
# https://github.com/ryanoasis/nerd-fonts
# cd nerd-fonts
./install.ps1 CascadiaCode

# shell customization
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module -Name z

# install winget from msstore

# OhMyPosh
winget install JanDeDobbeleer.OhMyPosh -s winget
Invoke-WebRequest "https://raw.githubusercontent.com/kmasalski/tools/main/winget.json" -OutFile winget.json
winget import winget.json

#powershell profile
$tools = (Invoke-WebRequest "https://raw.githubusercontent.com/kmasalski/tools/main/Microsoft.PowerShell_profile.ps1")
Invoke-Expression($tools.Content)


#https://stackoverflow.com/a/30209750/1219811
git config --global pull.rebase true
git config --global rebase.autoStash true

#https://stackoverflow.com/questions/6089294/why-do-i-need-to-do-set-upstream-all-the-time
git config  --global push.default current

#https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages
git config --global core.editor "code"

git config --global user.email ""
git config --global user.name ""