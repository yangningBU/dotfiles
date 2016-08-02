#!/bin/bash
# Remove symlinks
while read _sourceName _linkName
do
    echo "Removing symlink $_linkName"
    unlink $HOME/$_linkName
done < "$HOME/dotfiles/setupfiles.txt"
