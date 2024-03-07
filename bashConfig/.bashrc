#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH":"/home/anukul/.pub-cache/bin"
export PATH="$PATH:/home/anukul/Android/Sdk/flutter/bin"
export PATH="$PATH:/home/anukul/Development/flutter/bin"

# auto 'cd'
shopt -s autocd
