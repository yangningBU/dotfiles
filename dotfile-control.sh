#!/bin/bash
DOTFILES_DIR=.dotfiles
SETUP_FILE=setupfiles.txt
TRACKING_FILE=tracking.log
CURRENT_DIR="$(dirname $0)"
TODAY=$(date +"%Y-%m-%d")
LOG_FORMAT="%Y-%m-%d %H:%M:%S"
BACKUP_DIR=".ybackup-$TODAY"
INSTANCE="$USER@`hostname -f`"

logit(){
    echo "[$INSTANCE][`date +"$LOG_FORMAT"`] $1" >> $TRACKING_FILE
}
showit(){
    logit "$1"
    echo "[`basename $0`] $1"
}
if [ "$1" = "setup" ]; then
    # Clone this git repo
    showit "Cloning 'dotfiles' repo..."
    rm -rf "$HOME/$DOTFILES_DIR"
    git clone https://github.com/yangningBU/dotfiles.git "$HOME/$DOTFILES_DIR"
    showit "Backing up current settings..."
    
    
    # Create a backup directory to hide all of the old files and prevent clutter
    if [ ! -d $HOME/$BACKUP_DIR ]; then
        showit "Creating new backup directory called $BACKUP_DIR ..."
        mkdir $HOME/$BACKUP_DIR
    else
        showit "Using current backup directory from today..."
    fi
    
    # The setup file currently has each line entry with two values, 
    # the name of what the file is called in my repository (_sourceName)
    # followed by the name of the target file in the home directory (_linkName)
    # which are space delimited
    while read _sourceName _linkName
    do
        if [ -e $_sourceName ]; then
            showit "Moving $_sourceName ..."
            mv $HOME/$_sourceName $HOME/$BACKUP_DIR/
        fi
        showit "Setting up symlink $_linkName for $_sourceName"
        ln -s $CURRENT_DIR/$_sourceName $HOME/$_linkName
    done < "$CURRENT_DIR/$SETUP_FILE"

    showit "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    logit "Pushing log changes to origin/master..."
    cd $DOTFILES_DIR
    mv tracking.log tracking.log.$TODAY.$INSTANCE
    "find . -name \"tracking.log*\" | xargs git add"
    git commit -m "logging new setup"
    showit "Setup complete."
elif [ "$1" = "breakdown" ]; then
    showit "Preparing to remove yangningBU/dotfile changes on `hostname -f` for $USER"
else
    echo "Hey, you missed an input parameter. No worries, here's an example:"
    printf "$\t./dotfile-control.sh [setup|breakdown]\n"
fi
