
# Source .profile to get all variables
fenv source ~/.profile

# Change fish greeting
set fish_greeting ""

# Paths
set -U fish_user_paths $fish_user_paths ~/bin
set -U fish_user_paths $fish_user_paths ~/.local/bin

# Powerline
set fish_function_path $fish_function_path "/home/appaquet/.local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

# Aliases
alias l "ls"
# fzf
function fish_user_key_bindings
  fzf_key_bindings
end
