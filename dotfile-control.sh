#!/bin/bash
DOTFILES_DIR=dotfiles
SETUP_FILE=setupfiles.txt
TRACKING_FILE=tracking.log
LOG_DIR=logs
CURRENT_DIR="$(dirname $0)"
TODAY=$(date +"%Y-%m-%d")
LOG_FORMAT="%Y-%m-%d %H:%M:%S"
BACKUP_DIR=".ybackup"
NEW_BACKUP_DIR="$BACKUP_DIR-$TODAY"
INSTANCE="$USER@`hostname -f`"

logit(){
    echo "[$INSTANCE][`date +"$LOG_FORMAT"`] $1"
}
showit(){
    logit "$1"
}
if [ "$1" = "breakdown" ]; then
    showit "Preparing to remove yangningBU/dotfile changes on `hostname -f` for $USER"
elif [ "$1" = "help" ]; then
    echo "If you run without any input parameters, then the setup will run. Otherwise:"
    printf "$\t./dotfile-control.sh [help|breakdown]\n"
else
    # Remove any previous attempts to install
    cd $HOME
    rm -rf $DOTFILES_DIR
    # find . -maxdepth 1 -name "$BACKUP_DIR*" | xargs rm -rf
    # Clone this git repo
    showit "Cloning 'dotfiles' repo..."
    git clone https://github.com/yangningBU/dotfiles.git $DOTFILES_DIR
    showit "Backing up current settings..."
    # Create a backup directory to hide all of the old files and prevent clutter
    if [ ! -d $NEW_BACKUP_DIR ]; then
        showit "Creating new backup directory called $NEW_BACKUP_DIR ..."
        mkdir $NEW_BACKUP_DIR
    else
        # THIS WILL NEVER HAPPEN SINCE IF YOU REMOVE THE BACKUP FILES FIRST
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
            mv $_sourceName $NEW_BACKUP_DIR/
        fi
        showit "Setting up symlink $_linkName for $_sourceName"
        ln -s $HOME/$DOTFILES_DIR/$_sourceName $HOME/$_linkName
    done < "$HOME/$DOTFILES_DIR/$SETUP_FILE"

    showit "Installing Vundle"
    if [ ! -d $HOME/.vim/bundle ]; then
        logit ".vim/bundle doesn't exist, creating a new one"
        mkdir -p $HOME/.vim/bundle
    fi
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    showit "Setup complete."
fi
