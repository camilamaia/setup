## iTerm Configuration ##
curl -o ~/Library/Preferences/com.googlecode.iterm2.plist https://github.com/camilamaia/setup/blob/main/com.googlecode.iterm2.plist

## Base Tools ##
echo "Installing yq coreutils, curl and git..."
brew install yq coreutils curl git the_silver_searcher

## Oh My ZSH ##
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying .zshrc file ..."
curl -o ~/.zshrc https://raw.githubusercontent.com/camilamaia/setup/main/zshrc

echo "Installing Oh My ZSH plugins ..."
ZSH_PLUGINS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_PLUGINS_DIR}/zsh-autosuggestions

echo "Installing iterm-tab-color-oh-my-zsh..."
git clone https://github.com/bernardop/iterm-tab-color-oh-my-zsh.git ${ZSH_PLUGINS_DIR}/iterm-tab-color

## VS Code ##
echo "Configuring VS Code..."

echo "Copying VS Code User Settings..."
curl -o ~/Library/Application Support/Code/User/settings.json https://raw.githubusercontent.com/camilamaia/setup/main/vs-code-user-settings.json

echo "Installing VS Code plugins..."
curl -o vs-code-extensions.sh https://raw.githubusercontent.com/camilamaia/setup/main/vs-code-extensions.sh
chmod +x vs-code-extensions.sh
./vs-code-extensions.sh
rm vs-code-extensions.sh
