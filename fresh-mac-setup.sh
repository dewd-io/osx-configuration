 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 brew install --cask visual-studio-code
 git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
 git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
 git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
 brew install kubectl
 brew install neovim
 brew install --cask utm
 brew install qemu

 lines_to_add=(
  'plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete history)'
  'export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc'
  '. <(flux completion zsh)'
  'command -v flux >/dev/null && . <(flux completion zsh)'
  'echo "${fpath// /\n}" | grep -i completion'
  'flux completion zsh > _flux'
  'mv _flux ~/.oh-my-zsh/completions  # oh-my-zsh'
  'alias k="kubectl"'
  'alias c="clear"'
  'alias e="exit"'
)

# Loop through the lines and append them to ~/.zshrc
for line in "${lines_to_add[@]}"; do
  echo "$line" >> ~/.zshrc
done

# Source the updated .zshrc to apply the changes immediately
source ~/.zshrc

echo "Lines added to ~/.zshrc and sourced."

# List of extensions to install
extensions=(
    "yummygum.city-lights-theme"
    "ms-azuretools.vscode-docker"
    "GitHub.github-vscode-theme"
    "ms-kubernetes-tools.vscode-kubernetes-tools"
    "sdras.night-owl"
    "arcticicestudio.nord-visual-studio-code"
    "vscodevim.vim"
    "redhat.vscode-yaml"
    # Add more extensions as needed
)

# Install each extension
for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
done

echo "Visual Studio Code extensions installed successfully."