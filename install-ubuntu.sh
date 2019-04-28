#!/bin/bash
set -e

function confirm {
  echo -n $1
  echo -n " ([y]/n): "
  read ANS
  if [[ "$ANS" == "" ]] || [[ "$ANS" == "y" ]] || [[ "$ANS" == "Y" ]]; then
    ret="true"
  else
    ret="false"
  fi
}


confirm "Install packages?"
if [[ "$ret" == "true" ]]; then
  sudo apt install git neovim tmux fish curl cmake python-dev \
                   net-tools pkg-config libssl-dev valgrind dconf-editor \
                   autojump ripgrep chromium-browser dconf-editor gnome-tweaks
fi

confirm "Load gnome settings?"
if [[ "$ret" == "true" ]]; then
  # To dump: dconf dump /org/gnome/ > ./etc/ubuntu-dconf
  # Then cleanup unnecessary stuff
  dconf load /org/gnome/ < ./etc/ubuntu-dconf
fi

confirm "Change shell to fish?"
if [[ "$ret" == "true" ]]; then
  chsh -s `which fish`
  mkdir -p ~/.config/fish/ && ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/
  echo "You'll need to install oh-my-fish & plugins manually. See README.md"
fi

if [[ ! -d ~/dotfiles ]]; then
  git clone --recursive https://github.com/appaquet/dotfiles.git ~/dotfiles
fi


if [[ ! -f ~/dotfiles/fzf/bin/fzf ]]; then
  cd ~/dotfiles/fzf && ./install
fi

ln -sf ~/dotfiles/nvim ~/.config/
if [[ ! -d ~/.vim/bundle ]]; then
  nvim +BundleInstall +qall
  pushd ~/.vim/bundle/YouCompleteMe
  ./install.py
  popd
fi


ln -sf ~/dotfiles/tmux/gpakosz_tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local


confirm "Setup patched fonts?"
if [[ "$ret" == "true" ]]; then
  pushd ~/dotfiles/fonts
  ./install.sh
  popd
fi
