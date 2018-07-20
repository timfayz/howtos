#!/bin/bash

dir='~/dotfiles'
files=( # start from ~/
  '.bashrc'
  '.config/test/ok.txt'
)

FILE="asd/asda.asd.tar.gz"
echo $(dirname $FILE)

# make destination folder
mkdir -p $dir

# move and link
for file in "${iles[@]}"
do
  # make path from file's dirname
  [[ $(dirname $file) != '.' ]] && mkdir -p $dir/$(dirname $file)
  # move file to the path
  mv $file $dir/$(basename $file)
  echo "[$0] Move $file into $folder"
  #mv $file $dir
  echo "[$0] Link $file"
  #ln -s $dir/$file $file
done


########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .vim"        # list of files/folders to symlink in homedir

##########

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
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

source ~/.bashrc
source ~/.vimrc
