#!/bin/bash
DOTFILES_DIR=.dotfiles
SETUP_FILE=setupfiles.txt
TRACKING_FILE=tracking.log
CURRENT_DIR="$(dirname $0)"
TODAY=$(date +"%Y-%m-%d")
LOG_FORMAT="%Y-%m-%d %H:%M:%S"
BACKUP_DIR=".ybackup-$TODAY"

logit(){
    echo "[$USER@`hostname -f`][`date +"$LOG_FORMAT"`] $1" >> $TRACKING_FILE
}
showit(){
    logit "$1"
    echo $1
}
# Clone this git repo
showit "Cloning 'dotfiles' repo..."
echo "rm -rf \"$DOTFILES_DIR\""
echo "git clone https://github.com/yangningBU/dotfiles.git \"$DOTFILES_DIR\""
showit "Backing up current settings..."


# Create a backup directory to hide all of the old files and prevent clutter
if [ ! -d $HOME/$BACKUP_DIR ]; then
    showit "Creating new backup directory called $BACKUP_DIR ..."
    echo "mkdir \"$HOME/$BACKUP_DIR\""
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
        printf "\tmv $HOME/$_sourceName $HOME/$BACKUP_DIR/\n"
    fi
    printf "\tln -s $CURRENT_DIR/$_sourceName $HOME/$_linkName\n"
done < "$CURRENT_DIR/$SETUP_FILE"

showit "Setup complete."
