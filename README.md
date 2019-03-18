# appaquet's dotfiles
New version of my old [dotfiles](https://github.com/appaquet/app-vim)

## Setup
* Fish shell
  * To install
    * Ubuntu: `sudo apt install fish`
    * MacOS: `brew install fish`
  * Change shell (you may have to add to [`/etc/sheels`](https://stackoverflow.com/questions/453236/how-to-set-my-default-shell-on-mac))
    * Ubuntu: `chsh -s /usr/bin/fish`
    * MacOS: `chsh -s /usr/local/bin/fish`
  * Symlink config folder: `ln -s ~/dotfiles/fish/config.fish ~/.config/fish/`
  * Log out and log back
  * Install oh-my-fish framework
    * `curl -L https://get.oh-my.fish | fish`
  * Install plugins
    * `foreing-env` / `fenv` to import ~/.profile variables: `omf install foreign-env`

* fzf (shell fuzzing file finder / history finder)
  * To install
    * `cd ./fzf && ./install`

* Powerline
  * `pip install powerline-status`
  * [Install patched fonts](https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation)
    * [For ubuntu](https://github.com/powerline/fonts)
      * `sudo apt install fonts-powerline`
    * For MacOS
      * **TODO**

* Neovim
   * To install, see https://github.com/neovim/neovim/wiki/Installing-Neovim
     * Make sure to update alternatives on Ubuntu
   * Symlink config folder: `ln -s ~/dotfiles/nvim ~/.config/nvim`
   * Install plugins `vim +BundleInstall +qall`
   * Finish YouCompleteMe plugin installation
     * `cd /home/appaquet/.vim/bundle/YouCompleteMe`
     * `./install.py`

* Tmux
   * Symlink tmux conf: `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

## Usage
### Neovim
* My leader key is bound to backslash

* Useful custom commands
  * `E` or `New` to create a new file in the directory as the current buffer's file
  * `Delete` delete the file in current buffer without messing up vim's layout
  * `Rename` rename the current file and correctly replace current buffer with new file
  * `Ack` launches ack in a split buffer

* Useful custom mappings
  * `<leader> 1 through 9 ` to switch between opened buffers
  * `<leader>]` to switch to next buffer
  * `<leader>[` to switch to previous buffer
  * `<leader>w` to save current buffer
  * `<leader>x` to save and then execute current buffer (as long as it's chmod +x)
  * `<leader>r` to save current buffer and then execute `rsync.sh` in working dir
  * `<leader>q` to close the current buffer (equivalent to `:q`)
  * `<leader>w` to close the current buffer by trying not to messup the layout
  * `<leader><tab>` to switch between tab and spaces
  * `<ctrl>e` or `<leader>e` to toggle Nerdtree (files)
  * `<leader>d` if YouCompleteMe is available, go to definition
  * `<ctrl>p` fuzzy finding file
  * `<ctrl>a` fuzzy find the current word in files using ack
  * `<leader> m` to toggle mouse support (useful to allow select + copy)

* You can check [`init.vim`](nvim/init.vim) for more commands / mappings

### fzf
* Fuzzy finder in shell
* Usage:
  * `<ctrl>t` for fuzzing file find
  * `<ctrl>r` for fuzzing history find

### tmux
* `<ctrl>b e` to turn on synchronize panes typing
* `<ctrl>b E` to turn off synchronize panes typing
* `<ctrl>b m` to toggle mouse support (useful to allow select + copy)


## Per language setup
* [Rust](rust.md)
