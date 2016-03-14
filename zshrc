# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history time)
POWERLEVEL9K_VCS_FOREGROUND='black'
POWERLEVEL9K_STATUS_VERBOSE=false


ENABLE_CORRECTION="true"

plugins=(git vi-mode)

# User configuration

PATH="/opt/local/bin:/opt/local/sbin:/Users/frederikvanslycken/toolchains/gcc-arm-none-eabi-4_9-2015q1/bin/:/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/CrossPack-AVR/bin:/usr/local/git/bin:/usr/texbin"
PATH=$PATH:"/Users/frederikvanslycken/Projects/Android/sdk/tools:/Users/frederikvanslycken/Projects/Android/sdk/platform-tools"
PATH=$PATH":/Applications/microchip/xc32/v1.40/bin:/Applications/microchip//mplabx/v3.20/mplab_ide.app/Contents/Resources/mplab_ide/bin"
PATH=$PATH:"/Users/frederikvanslycken/bin/cov-analysis-macosx-7.7.0.4/bin"

export PATH

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export DEFAULT_USER=frederikvanslycken
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

#based on http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
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


renson=/Users/frederikvanslycken/Projects/renson/skye/skye/src
rentest=/Users/frederikvanslycken/Projects/renson/skye/skye/testing
picotcp=/Users/frederikvanslycken/Projects/picoTCP/picotcp
tcd=/Users/frederikvanslycken/Projects/picoTCP/tass-connected-device
