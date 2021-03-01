#!/bin/zsh

# TODO before running:
# 1) Switch shell to zsh
# 2) Create a custom.zsh file in the dotfiles directory
# (this is where host-specific aliases et. al. will go)
# 3) Make directory ~/zsh_custom

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# credit: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# modified by me

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

dir=~/dotfiles                 # dotfiles directory
olddir=~/dotfiles_old          # old dotfiles backup directory
files=(zshrc emacs emacs.d)    # list of files/folders to symlink in homedir
custom_zsh_files=(aliases.zsh custom.zsh functions.zsh)

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

# move custom zsh files to oh-my-zsh custom directory
for file in $custom_zsh_files; do
    echo "Creating symlink to $file in $ZSH_CUSTOM"
    ln -s $dir/$file $ZSH_CUSTOM/$file
done
