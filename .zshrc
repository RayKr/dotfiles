# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zi setting
typeset -A ZI
ZI[BIN_DIR]="${HOME}/.zi/bin"
source "${ZI[BIN_DIR]}/zi.zsh"
# source <(curl -sL init.zshell.dev); zzinit
zi load z-shell/H-S-MW
zi light z-shell/F-Sy-H
zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-autosuggestions
zi snippet https://gist.githubusercontent.com/hightemp/5071909/raw/
zi ice depth=1; zi light romkatv/powerlevel10k
zi snippet OMZ::plugins/npm/npm.plugin.zsh
zi snippet OMZ::plugins/sudo/sudo.plugin.zsh
zi snippet OMZ::plugins/git/git.plugin.zsh

# go env setting
export GOROOT=/usr/local/go
export GOPATH=/Users/jzl/go
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jzl/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jzl/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jzl/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jzl/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls="colorls --dark"
alias lc='colorls -lA --sd'

# openwrt
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/jzl/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# inkscape
export PATH="/Applications/Inkscape.app/Contents/MacOS:$PATH"

# p10k bottom config, don't set anything behide this.
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
