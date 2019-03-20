
# Source ~/.profile 
fenv source ~/.profile

# Paths
set -U fish_user_paths $fish_user_paths ~/bin
set -U fish_user_paths $fish_user_paths ~/.local/bin

# Aliases
alias l "ls"
alias vim "nvim"
alias vi "nvim"

# fzf
function fish_user_key_bindings
  fzf_key_bindings
end

# Theme
set -g theme_color_scheme base16-dark

# Source local configuration
[ -f ~/.config/fish/local.fish ]; and source ~/.config/fish/local.fish
