# ====== Install packages ======
brew install --cask font-meslo-lg-nerd-font
brew install tmux
brew install neovim
brew install fzf
brew install --cask wezterm
brew install direnv

# Python version management
brew install pyenv

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install zoxide # smarter cd


# ====== Set up symlinks ======

# Get the current working directory
PWD=$(pwd)

# Find all hidden files (excluding `.` and `..`) in the current directory
FILES=$(find . -maxdepth 1 -type f -name ".*")

# Loop through the files and create symlinks
for FILE in $FILES; do
  BASENAME=$(basename "$FILE")
  SOURCE="$PWD/$BASENAME"
  TARGET="$HOME/$BASENAME"

  # Check if the target already exists
  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "Backing up existing $TARGET to ${TARGET}.bak"
    mv "$TARGET" "${TARGET}.bak"
  fi

  # Create the symlink
  echo "Creating symlink from $SOURCE to $TARGET"
  ln -s "$SOURCE" "$TARGET"

  # Verify the symlink creation
  if [ -L "$TARGET" ]; then
    echo "Symlink for $BASENAME created successfully!"
  else
    echo "Failed to create symlink for $BASENAME."
  fi
done
