
# Source ~/.profile 
fenv source ~/.profile

# Paths
# We don't use the normal fish_user_paths because it slows down everything in the config.fish
# See https://github.com/fish-shell/fish-shell/issues/2688
set -x PATH ~/bin ~/.local/bin $PATH

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
