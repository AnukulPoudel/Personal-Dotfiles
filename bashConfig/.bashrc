#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# auto 'cd'
shopt -s autocd

# use amd-gpu for alacritty
export DRI_PRIME=1
