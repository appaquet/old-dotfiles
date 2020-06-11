#!/bin/bash
set -e
CUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $CUR_DIR

export DOTFILES=$(pwd)
if [[ ! -d $DOTFILES ]]; then
  cd ~/
  git clone --recursive https://github.com/appaquet/dotfiles.git
  export DOTFILES=$(pwd)/dotfiles
fi

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
  sudo apt install git neovim tmux fish curl cmake python3-dev htop \
                   net-tools pkg-config libssl-dev valgrind dconf-editor \
                   autojump ripgrep dconf-editor gnome-tweaks xclip clang \
                   qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager \
                   dstat chrome-gnome-shell jq pavucontrol
fi

confirm "Load gnome settings?"
if [[ "$ret" == "true" ]]; then
  # To dump: dconf dump /org/gnome/ | $DOTFILES/bin/inisort > ./etc/ubuntu-dconf
  # Then cleanup unnecessary stuff
  dconf load /org/gnome/ < ./etc/ubuntu-dconf
fi

confirm "Change shell to fish?"
if [[ "$ret" == "true" ]]; then
  chsh -s `which fish`
  mkdir -p ~/.config/fish/ && ln -sf $DOTFILES/fish/config.fish ~/.config/fish/
  echo "You'll need to install oh-my-fish & plugins manually. See README.md"
fi

if [[ ! -f $DOTFILES/fzf/bin/fzf ]]; then
  cd $DOTFILES/fzf && ./install
fi

ln -sf $DOTFILES/nvim ~/.config/
if [[ ! -d ~/.vim/bundle ]]; then
  nvim +BundleInstall +qall
  pushd ~/.vim/bundle/YouCompleteMe
  ./install.py
  popd
fi

ln -sf $DOTFILES/tmux/gpakosz_tmux/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/tmux/tmux.conf.local ~/.tmux.conf.local
ln -sf $DOTFILES/idea/.ideavimrc ~/.ideavimrc

if [[ ! -f "/usr/lib/systemd/system-sleep/stop_docker.sh" ]]; then
  sudo ln -s $DOTFILES/misc/stop_docker.sh /usr/lib/systemd/system-sleep/stop_docker.sh
fi

confirm "Setup patched fonts?"
if [[ "$ret" == "true" ]]; then
  pushd $DOTFILES/fonts
  ./install.sh
  popd
fi

git config --global rerere.enabled true
git config --global push.default current
