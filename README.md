# appaquet's dotfiles
New version of my old [dotfiles](https://github.com/appaquet/app-vim)

## Shell & editor setup
* Checkout this repo recursively in your ~/
  * `git clone --recursive https://github.com/appaquet/dotfiles.git ~/dotfiles`

* [Fish shell](https://fishshell.com/)
  * To install
    * Ubuntu: `sudo apt install fish`
    * MacOS: `brew install fish` and follow instructions about adding fish to `/etc/shells`
  * Change your shell
    * Ubuntu: `chsh -s /usr/bin/fish`
    * MacOS: `chsh -s /opt/homebrew/bin/fish` (you may have to add it to /etc/shells for MacOS to accept to install)
  * Symlink fish's config folder: `mkdir -p ~/.config/fish/ && ln -s ~/dotfiles/fish/config.fish ~/.config/fish/`
  * Log out and log back (you'll get errors as not everyhing is setup yet)
  * Install oh-my-fish framework
    * `curl -L https://get.oh-my.fish | fish`
  * Install plugins & themes
    * `foreign-env` / `fenv` to import ~/.profile variables: `omf install foreign-env`
    * `bobthefish` theme: `omf install bobthefish` and then `omf theme bobthefish`

  * **Notes**
    * You can still use your `~/.profile` as you would do in bash thanks to the `foreign-env` plugin that sources your `~/.profile`
      * You should not change PATHs from ~/.profile. Use fish persisted PATH instead.
      * To add a path: `set -Ua fish_user_paths /some/new/path`
      * To list current paths: `echo $fish_user_paths | tr " " "\n" | nl`
      * TO remove a path: `set --erase PATH[NUMBER AS LISTED STARTING AT 1]`
    * You can put any local specifc fish config in `~/.config/fish/local.fish`

* [fzf](https://github.com/junegunn/fzf) (shell fuzzy shell history finder & fuzzy file finder)
  * To install
    * `cd ./fzf && ./install`

* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
   * To install, see https://github.com/neovim/neovim/wiki/Installing-Neovim
     * Make sure to update alternatives on Ubuntu
     * On MacOS, you may need to install [python neovim](https://ricostacruz.com/til/neovim-with-python-on-osx): `pip3 install neovim --upgrade`
   * Symlink config folder: `ln -s ~/dotfiles/nvim ~/.config/nvim`
   * Install plugins `nvim +BundleInstall +qall`
   * Finish YouCompleteMe plugin installation
     * `cd ~/.vim/bundle/YouCompleteMe`
     * `./install.py`

* [tmux](https://github.com/tmux/tmux)
   * I use [Gpakosz](https://github.com/gpakosz/.tmux) self-contained tmux configuration, which is checked out as a submodule.
   * Symlink main tmux config: `ln -s ./dotfiles/tmux/gpakosz_tmux/.tmux.conf ~/.tmux.conf`
   * Symlink personalized conf: `ln -s ./dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local`
   * Install plugins by launching tmux and pressing: `ctrl-b shift-i`

* [Autojump](https://github.com/wting/autojump) (Fast jumping to directories)
  * To install
    * Ubuntu: `sudo apt install autojump`
    * MacOS: `brew install autojump`
  * You can add the bootstrap script to your `~/.config/fish/local.fish`
    * MacOS: `[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish`
    * Ubuntu: `[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish`

* [RipGrep](https://github.com/BurntSushi/ripgrep) (A very fast grep / ack replacement)
  * To install
    * Ubuntu: `sudo apt install ripgrep`
    * MacOS: `brew install ripgrep`

* [bat](https://github.com/sharkdp/bat) (A `cat` replacement with syntax highlighting & git integration)
  * To install: `cargo install bat`

* [Git-delta](https://crates.io/crates/git-delta) (Much better git diff)
  * To install
    * Ubuntu: `cargo install git-delta`
    * MacOS: `brew install git-delta`
  * Install in git:
    * `git config --global core.pager "delta --dark"  # --light for light terminal backgrounds`
    * `git config --global delta.navigate true` to allow navigation using `n` for next file, and `Shift-N` for previous file
    * Change theme to [this one](https://github.com/dandavison/delta#side-by-side-view-1) (`vim ~/.gitconfig`)

* [Bottom](https://github.com/ClementTsang/bottom) (Htop alternative with disk + network)
  * To install
    * Ubuntu: `cargo install bottom`
    * MacOS: `brew install clementtsang/bottom/bottom`

* [Bandwhich](https://github.com/imsnif/bandwhich) (Network monitoring / top like by process/hosts)
  * To install: `cargo install bandwhich`

* [Dua](https://github.com/Byron/dua-cli) (Disk usage / cleanup)
  * To install: `cargo install dua-cli`
  * To use: `dua interactive`

* [asdf](https://github.com/asdf-vm/asdf)
  * Checkout asdf: `git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1`
  * Then add `source ~/.asdf/asdf.fish` to `~/.config/fish/local.fish`
  * Configure completions: `mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions`
  * May need to install for zsh too to make it work in vscode
    * Add `. $HOME/.asdf/asdf.sh` to `~/.zshrc`
  * Quick usage
    * Install nodejs: `asdf plugin-add nodejs`
    * List all versions of nodejs: `asdf list all nodejs`
    * Install a version: `asdf install nodejs 12.22.1` or `asdf install nodejs latest`
    * List install versions: `asdf list nodejs`
    * Use version in directory: `asdf local nodejs 12.22.1`
    * Use version globally: `asdf global nodejs latest`
  * [All commands](http://asdf-vm.com/manage/commands.html)

* [Alacritty](https://github.com/jwilm/alacritty) (A GPU accelerated terminal written in Rust)
  * Main advantage of Alacritty is it's cross platform and configurable via a configuration file
  * To install:
    * MacOS: Use released dmg from repo
      * Install fonts from `fonts` (FiraMono)
    * Ubuntu: Manually install from [Pop!_OS package](https://launchpad.net/~system76/+archive/ubuntu/pop/+packages?field.name_filter=alacritty&field.status_filter=published&field.series_filter=focal)
    * Install patched fonts
      * `cd fonts; ./install.sh`
    * Symlink config folder: `mkdir -p ~/.config/alacritty/; ln -s ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml`

* JetBrains' idea based IDEs
  * Symlink vim config: `ln -sf ~/dotfiles/idea/.ideavimrc ~/.ideavimrc`

* Utils
  * Add `bin` to path: 
    * `fish_add_path /Users/appaquet/dotfiles/bin`
    * or via `~/.profile`: `PATH="$HOME/dotfiles/bin:$PATH"`

## Other setup
* [Rust](rust.md)
* [Ubuntu Desktop](ubuntu.md)

## Usage
### Fish
* With no input `<alt><left>` or `<alt><right>` to jump to previous directory in history
* With input `<alt><left>` or `<alt><right>` to between words
* With input `<ctl>w` to delete previous word
* With input `<alt>e` to open input in editor

### Neovim
* My leader key is bound to `\` (backslash)

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
  * `<leader>z` to execute current visual selection in a shell
  * `<leader>r` to save current buffer and then execute `rsync.sh` in working dir
  * `<leader>q` to close the current buffer (equivalent to `:q`)
  * `<leader>w` to close the current buffer by trying not to messup the layout
  * `<leader><tab>` to switch between tab and spaces
  * `<ctrl>e` or `<leader>e` to toggle Nerdtree (files)
  * `<leader>d` if YouCompleteMe is available, go to definition
  * `<ctrl>p` fuzzy finding file
  * `<ctrl>a` fuzzy find the current word in files using ack
  * `<leader>m` to toggle mouse support (useful to allow select + copy)
  * `<leader>y` to yank to clipboard using [bin/pbcopy](bin/pbcopy) util
  * `<leader>p` to paste from clipboard using [bin/pbpaste](bin/pbpaste) util

* You can check [`init.vim`](nvim/init.vim) for more commands / mappings

### fzf (in shell)
* In shell
  * `<ctrl>t` for fuzzy file find
  * `<ctrl>r` for fuzzy history find

### tmux
* Main shortcuts
  * `<ctrl>b e` to toggle synchronized panes
  * `<ctrl>b m` to toggle mouse support (useful to allow select + copy)
  * `<ctrl>b <ctrl>l` to navigate to next window
  * `<ctrl>b <ctrl>h` to navigate to prev window
  * `<ctrl>b <tab>` to navigate to last window
  * `<ctrl>b <alt><arrows>` to resize pane
  * `<ctrl>b <enter>` to get into copy mode
    * `v` for selection 
    * `ctrl-v` to switch between between block and line selection 
    * `y` to yank
    * `H` and `L` start line / end line
  * `<ctrl>b q` to show pane ids, then `:swap-pane -s X -t Y` to swap

* For more shorcuts, see [here](https://github.com/gpakosz/.tmux)

* Plugins  
  * [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
    * `<ctrl>b <ctrl>s` to save current layout
    * `<ctrl>b <ctrl>r` to ressurect last saved layout

### Autojump
* In shell
  * `j somefolder` to jump to a folder that contains somefolder that you cd'ed to previously
  * `jc somefolder` to jump to a child folder
  * `jo [folder]` to jump to a folder using the system's file manager

### Ripgrep
* In shell
  * `rg <pattern>` to find any files that contain the given pattern
  * `vimrg <pattern>` to open matching files in vim + highlight matches
* In vim
  * `Rg <pattern>` to ripgrep the given pattern
  * `<leader>r` to ripgrep the current word

