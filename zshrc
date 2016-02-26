# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="agnoster-light"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME='light'

ENABLE_CORRECTION="true"

plugins=(git vi-mode)

# User configuration

export PATH="/opt/local/bin:/opt/local/sbin:/Users/frederikvanslycken/toolchains/gcc-arm-none-eabi-4_9-2015q1/bin/:/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/CrossPack-AVR/bin:/usr/local/git/bin:/usr/texbin:/Users/frederikvanslycken/Projects/Android/sdk/tools:/Users/frederikvanslycken/Projects/Android/sdk/platform-tools:/Applications/microchip/xc32/v1.40/bin"":/Applications/microchip//mplabx/v3.20/mplab_ide.app/Contents/Resources/mplab_ide/bin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias clr="clear;clear"

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


renson=/Users/frederikvanslycken/Projects/renson/hoc/code-Main/hoc/src
picotcp=/Users/frederikvanslycken/Projects/picoTCP/picotcp
tcd=/Users/frederikvanslycken/Projects/picoTCP/tass-connected-device
