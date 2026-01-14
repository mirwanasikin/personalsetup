# ===============================
# Nix (load early for PATH)
# ===============================
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# ===============================
# Interactive only
# ===============================
[[ -o interactive ]] || return

# ===============================
# Fastfetch (local only)
# ===============================
if [[ -z "$SSH_CONNECTION" ]]; then
  fastfetch
fi

# ===============================
# History
# ===============================
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory inc_append_history
setopt hist_ignore_dups hist_reduce_blanks

# ===============================
# Completion
# ===============================
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select

# ===============================
# Plugins
# ===============================
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===============================
# Prompt
# ===============================
eval "$(oh-my-posh init zsh --config ~/jandedobbeleer.omp.json)"

# ===============================
# Tools
# ===============================
eval "$(zoxide init zsh)"
if command -v fzf >/dev/null; then
  source <(fzf --zsh)
fi
# ===============================
# Aliases
# ===============================
alias suhu='sensors'
alias cat='bat'
alias vi='nvim'
alias cl='clear'

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --git'
alias tree='eza --tree'

alias cd='z'        # opinionated, personal
alias suspend='sudo systemctl suspend'
alias reboot='sudo reboot now'


if [ -e /home/tenka/.nix-profile/etc/profile.d/nix.sh ]; then . /home/tenka/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
