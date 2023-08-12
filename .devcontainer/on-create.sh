## Install additional apt packages
sudo apt-get update \
    && sudo apt upgrade -y \
    && sudo apt-get install -y dos2unix libsecret-1-0 xdg-utils \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

## Configure git
git config --global pull.rebase false
git config --global core.autocrlf input

## Enable local HTTPS for .NET
dotnet dev-certs https --trust

## Restore .NET packages and build the default solution
dotnet restore && dotnet build

## AZURE STATIC WEB APPS CLI ##
# Uncomment the below to install Azure Static Web Apps CLI. Make sure you have installed node.js
npm install -g @azure/static-web-apps-cli

## GitHub Copilot CLI ##
npm install -g @githubnext/github-copilot-cli
eval "$(github-copilot-cli alias -- "$0")"

## OH-MY-POSH ##
# Uncomment the below to install oh-my-posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

## Add GitHub Copilot CLI alias to .zshrc
echo '
# Add GitHub Copilot CLI alias to .zshrc
alias ghcp='github-copilot-cli'
eval "$(github-copilot-cli alias -- "$0")"
' >> $HOME/.zshrc

## Add GitHub Copilot CLI alias to .bashrc
echo '
# Add GitHub Copilot CLI alias to .bashrc
alias ghcp='github-copilot-cli'
eval "$(github-copilot-cli alias -- "$0")"
' >> $HOME/.bashrc
