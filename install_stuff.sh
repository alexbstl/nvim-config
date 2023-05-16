#!/bin/bash

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install neovim-remote

# Function to install packages using package manager
install_packages() {
  if [ "$(command -v apt-get)" ]; then
    sudo apt-get update
    sudo apt-get install -y "$@"
  elif [ "$(command -v pacman)" ]; then
    sudo pacman -Syu --noconfirm "$@"
  elif [ "$(command -v pkg)" ]; then
    sudo pkg update
    sudo pkg install -y "$@"
  elif [ "$(command -v brew)" ]; then
    brew install "$@"
  else
    echo "Unable to detect package manager. Please install fd and ripgrep manually."
    exit 1
  fi
}

# Detect the operating system
if [ "$(uname)" == "Darwin" ]; then
  echo "Detected macOS"
  # Assuming you have Homebrew installed on macOS
  install_packages fd ripgrep
elif [ -e "/etc/os-release" ]; then
  source "/etc/os-release"
  case "$ID" in
    ubuntu | linuxmint | pop | elementary)
      echo "Detected Ubuntu, Linux Mint, Pop!_OS, or Elementary OS"
      install_packages fd-find ripgrep
      ;;
    arch | manjaro)
      echo "Detected Arch Linux or Manjaro"
      install_packages fd ripgrep
      ;;
    *)
      echo "Unknown Unix-based OS. Please install fd and ripgrep manually."
      exit 1
      ;;
  esac
elif [ "$(uname)" == "FreeBSD" ]; then
  echo "Detected FreeBSD"
  install_packages fd ripgrep
else
  echo "Unknown Unix-based OS. Please install fd and ripgrep manually."
  exit 1
fi

echo "Installation complete."
