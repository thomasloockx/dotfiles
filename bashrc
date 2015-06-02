export PATH=~/bin/:$PATH

alias ll='ls -l'

# CUDA stuff
PATH=$PATH:/usr/local/cuda/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH
export LD_LIBRARY_PATH

# use vim as my default editor
export EDITOR=vim

# fast path to my workspaces
alias w1='cd ~/dev/wip-1'
alias w2='cd ~/dev/wip-2'
alias w3='cd ~/dev/wip-3'
# very fast building
alias fmk='make -j5'
