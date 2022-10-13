# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_COLOR_SCHEME='light'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history time)
#POWERLEVEL9K_VCS_FOREGROUND='black'
#POWERLEVEL9K_STATUS_VERBOSE=false


ENABLE_CORRECTION="true"

plugins=(git vi-mode)

# User configuration


export PATH

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export DEFAULT_USER=`whoami`
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

#based on http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[blue]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
bindkey '^r' history-incremental-search-backward

# I want global history for e.g. ctrl-R lookup, but local history for e.g. ctrl-P, up-arrow
# thanks to http://superuser.com/a/1025836 , only the bindkey mentioned there didn't work for me. I found out what worked by going ctrl-V <up-arrow>, which printed ^[[A, which works... YMMV
up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history
bindkey '^P' up-line-or-local-history     # ctrl-P
bindkey '^N' down-line-or-local-history   # ctrl-N
bindkey '^[[A' up-line-or-local-history     # Cursor up
bindkey '^[[B' up-line-or-local-history     # Cursor up

QNTQ=~/Projects/Qteal/Qinetiq
PNEXT_BASE=~/Projects/Qteal/Qinetiq/svn/pnextav
BSW=~/Projects/Qteal/Qinetiq/svn/pnextav/src/BSW
BOOTLOADER=~/Projects/Qteal/Qinetiq/svn/pnextav/src/BOOTLOADER
TEST_SUITE=~/Projects/Qteal/Qinetiq/svn/pnextav/src/TEST_APPS/NEW_HW_TEST_SUITE

HERA_BASE=~/Projects/Qteal/Qinetiq/svn/hera
MMU=~/Projects/Qteal/Qinetiq/svn/hera/src/MMU_BSW
MMU_TEST_SUITE=~/Projects/Qteal/Qinetiq/svn/hera/src/TEST_APPS/MMU_TEST_SUITE

# no-op command ; causes these named directories to be used right away
# see http://zsh.sourceforge.net/Guide/zshguide02.html
: ~QNTQ ~BSW ~BOOTLOADER ~TEST_SUITE ~PNEXT_BASE ~HERA_BASE ~MMU ~MMU_TEST_SUITE
