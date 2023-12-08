echo "Copying .zshrc..."
cp ~/.zshrc zshrc

echo "Copying iterm2 preferences..."
cp ~/Library/Preferences/com.googlecode.iterm2.plist com.googlecode.iterm2.plist
plutil -convert xml1 com.googlecode.iterm2.plist

echo "Saving VS Code extensions ..."
code --list-extensions | xargs -L 1 echo code --install-extension > vs-code-extensions.sh
