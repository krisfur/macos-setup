# speed up hiding the dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder

# get Google Chrome
https://www.google.com/chrome/

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
#and copy kitty-theme.conf to the end of cmd+,

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#then follow the instructions to add to path or do:
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# get github cli
brew install gh
gh auth login
#authenticate in browser

# get VS Code
https://code.visualstudio.com/download
#and log in with github for sync

# get cursor (after VS Code to yoink extensions from backup)
https://www.cursor.com/downloads
#and log in with github for monies

# install Chat Gippidy app
https://openai.com/chatgpt/download/

# install C++ tings
brew install gcc cmake pkg-config sdl2 raylib

# install go
brew install go
#add go to path
vim ~/.zshenv   
export PATH="$HOME/go/bin:$PATH"

# install npm
brew install npm

# install fastfetch because it's cool
brew install fastfetch

# install neovim
brew install neovim
#and lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

# install tmux
brew install tmux

# useful cli tools
brew install bat exa fd ripgrep fzf tree htop jq

# fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code font-jetbrains-mono