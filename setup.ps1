#installs essential applications
winget import winget.json;

dotnet tool install --global dotnet-ef

#installs scoop 
iwr -useb get.scoop.sh | iex

#installs Hack-NF;
scoop bucket add nerd-fonts;
scoop install Hack-NF;

#installs shell customizations;
Install-Module -Name z;
Install-Module -Name Terminal-Icons -Repository PSGallery;
scoop install lsd
Install-Module PSReadLine;
Install-Module posh-git;

#installs structurizr
scoop bucket add extras
scoop install structurizr-cli
