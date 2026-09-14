#!/bin/bash

# Configure the bash shell using Omakupt defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakupt/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omakupt/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omakupt defaults
cp ~/.local/share/omakupt/configs/inputrc ~/.inputrc
