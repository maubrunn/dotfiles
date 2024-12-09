# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/mamba.sh" ]; then
    . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
#
eval "$(starship init zsh)"
alias ll='ls -alF'
source <(fzf --zsh)
eval $(thefuck --alias)

zstyle ':completion:*:*:make:*' tag-order 'targets'


autoload -Uz compinit && compinit
autoload bashcompinit
source <(docker completion zsh)
source /Users/moe/.cargo/env
. "/Users/moe/.deno/env"
setopt HIST_IGNORE_DUPS
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
