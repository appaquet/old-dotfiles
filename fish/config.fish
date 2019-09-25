
# Source ~/.profile 
fenv source ~/.profile

# Paths
# We don't use the normal fish_user_paths because it slows down everything in the config.fish
# See https://github.com/fish-shell/fish-shell/issues/2688
set -x PATH ~/bin ~/dotfiles/bin ~/.local/bin $PATH

# Aliases
alias l 'ls'
alias vim 'nvim'
alias vi 'nvim'

abbr jql 'jq -C . | less --raw'
abbr gs 'git status'
abbr gd 'git diff'
abbr gp 'git pull'
abbr gck 'git checkout'
abbr gcm 'git commit -m'
abbr gpom 'git pull origin master'
abbr gca 'git commit --amend'
abbr gr 'git rev-parse --short @'
abbr gb 'git for-each-ref --sort=-committerdate refs/heads/ --format="%(color: red)%(committerdate:short) %(color: 244)-- %(color: cyan)%(refname:short) %(color: 244)-- %(color: green)%(subject)"'

# fzf
function fish_user_key_bindings
  fzf_key_bindings
end

# Theme
set -g theme_color_scheme base16-dark

# Source local configuration
[ -f ~/.config/fish/local.fish ]; and source ~/.config/fish/local.fish
