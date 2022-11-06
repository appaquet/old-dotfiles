# Put fish in vi mode
fish_vi_key_bindings

# Source ~/.profile 
fenv source ~/.profile

# Paths
# We don't use the normal fish_user_paths because it slows down everything in the config.fish
# See https://github.com/fish-shell/fish-shell/issues/2688
set -x PATH ~/bin ~/dotfiles/bin $PATH

# Aliases
alias l 'ls'
alias vim 'nvim'
alias vi 'nvim'
alias k 'kubectl'

abbr jql 'jq -C . | less --raw'
abbr gs 'git status'
abbr gls 'git log --stat'
abbr glm 'git log --merges --first-parent'
abbr gd 'git diff'
abbr gds 'git diff --staged'
abbr gp 'git pull'
abbr gck 'git checkout'
abbr gcm 'git commit -m'
abbr gchm 'git commit -c HEAD'
abbr gpom 'git pull origin master'
abbr gpr 'git pull --rebase --autostash'
abbr gca 'git commit --amend'
abbr gr 'git rev-parse --short=7 @'
abbr gb 'git for-each-ref --sort=-committerdate refs/heads/ --format="%(color: red)%(committerdate:short) %(color: 244)-- %(color: cyan)%(refname:short) %(color: 244)-- %(color: green)%(subject)"'
abbr grsw 'git restore --staged --worktree'
abbr grws 'git restore --staged --worktree'
abbr grs 'git restore --staged'
abbr ghpr 'gh pr create --draft --body "" --title'
abbr gts 'git tag --sort version:refname'
abbr randstr 'tr -cd "[:alnum:]" < /dev/urandom | fold -w30 | head -n1'

abbr kgetall 'kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n '


# ripgrep & open files in vim
function vimrg
  vim -c "execute \"Rg $argv\n\"" (rg -l "$argv")
end

# fzf
function fish_user_key_bindings
  fzf_key_bindings
end

# Theme (`bobthefish_display_colors --all` to preview them)
set -g theme_color_scheme base16

# Source local configuration
[ -f ~/.config/fish/local.fish ]; and source ~/.config/fish/local.fish

# Fixes macOS slow tab completion
# See https://github.com/fish-shell/fish-shell/issues/6270
if test (uname) = Darwin
  function __fish_describe_command; end
end
