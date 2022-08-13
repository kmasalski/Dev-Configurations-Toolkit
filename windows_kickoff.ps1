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

git config --global user.email ""
git config --global user.name ""
