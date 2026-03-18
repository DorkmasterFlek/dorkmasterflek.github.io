#!/bin/fish

# ******** Extra user setup for myself.

curl -fsL https://raw.githubusercontent.com/DorkmasterFlek/dorkmasterflek.github.io/master/fish_extra >> ~/.config/fish/config.fish
curl -fsL https://raw.githubusercontent.com/DorkmasterFlek/dorkmasterflek.github.io/master/gitignore_global -o ~/.gitignore_global
curl -fsL https://raw.githubusercontent.com/DorkmasterFlek/dorkmasterflek.github.io/master/gitconfig -o ~/.gitconfig

# Disable directory shortening in the shell prompt.
set -U fish_prompt_pwd_dir_length 0
