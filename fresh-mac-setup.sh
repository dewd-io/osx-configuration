 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

 brew install git
 brew install --cask visual-studio-code
 brew install kubectl
 brew install neovim
 brew install --cask utm
 brew install qemu
 brew install helm
 brew install terraform
 brew install --cask google-cloud-sdk
 brew install wget
 brew install --cask docker
 brew install --cask kitty
 brew install tmux
 brew install ripgrep
 brew install node
 brew install --cask flux
 brew install tflint
 xcode-select --install

 touch ~/.tmux.conf

 git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
 git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
 git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

 lines_to_add=(
  'plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete history web-search)'
  'export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc'
  '. <(flux completion zsh)'
  'command -v flux >/dev/null && . <(flux completion zsh)'
  'echo "${fpath// /\n}" | grep -i completion'
  'flux completion zsh > _flux'
  'mv _flux ~/.oh-my-zsh/completions  # oh-my-zsh'
  'alias k="kubectl"'
  'alias c="clear"'
  'alias e="exit"',
  'alias vi="nvim"',
  'alias vim="nvim"'

)

# Loop through the lines and append them to ~/.zshrc
for line in "${lines_to_add[@]}"; do
  echo "$line" >> ~/.zshrc
done

# Source the updated .zshrc to apply the changes immediately
source ~/.zshrc

echo "Lines added to ~/.zshrc and sourced."

lines_to_add_tmux=(
	'set -g default-terminal "screen-256color"',
	'set -g prefix C-a',
	'unbind C-b',
	'bind-key C-a send-prefix',
	'unbind %',
	'bind | split-window -h',
	'unbind ''"',
	'bind - split-window -v',
	'unbind r',
	'bind r source-file ~/.tumux.conf',
	'bind -r j resize-pane -D 5',
	'bind -r k resize-pane -U 5',
	'bind -r l resize-pane -R 5',
	'bind -r h resize-pane -L 5',
	'bind -r m resize-pane -Z',
	'set -g mouse off',
	'set-window-option -g mode-keys vi',
	'bind-key -T copy-mode-vi 'v' send -X begin-selection', # start selecting text with "v"
	'bind-key -T copy-mode-vi 'y' send -X copy-selection', # copy text with "y"
	'unbind -T copy-mode-vi MouseDragEnd1Pane', # don't exit copy mode after dragging with mouse
	# tpm plugin
	'set -g @plugin 'tmux-plugins/tpm'',
	# list of tmux plugins
	'set -g @plugin 'christoomey/vim-tmux-navigator'', # for navigating panes and vim/nvim with Ctrl-hjkl
	'set -g @plugin 'jimeh/tmux-themepack'', # to configure tmux theme
	'set -g @plugin 'tmux-plugins/tmux-resurrect'', # persist tmux sessions after computer restart
	'set -g @plugin 'tmux-plugins/tmux-continuum'', # automatically saves sessions for you every 15 minutes
	'set -g @themepack 'powerline/default/cyan'', # use this theme for tmux
	'set -g @resurrect-capture-pane-contents 'on'', # allow tmux-ressurect to capture pane contents
	'set -g @continuum-restore 'on'' # enable tmux-continuum functionality

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
)

for line in "${lines_to_add_tmux[@]}"; do
	echo "$line" >> ~/.tmux.conf
done

echo "Lines added to ~/.tmux.conf"

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
