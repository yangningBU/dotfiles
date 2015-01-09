#!/bin/bash
#
# Run this script to setup the vim configuration on any machine. Can be run
# as a oneliner with the following commands:
#
# Using curl:
# curl -L https://raw.githubusercontent.com/AndoidOatmeal/dotfiles/master/viminstall.sh | sh
# Using wget:
# wget --no-check-certificate https://raw.githubusercontent.com/AndoidOatmeal/dotfiles/master/viminstall.sh -O - | sh
#

DOTFILES_DIR=~/dotfiles
VIMRC_PATH=~/.vimrc
VIM_DIR=~/.vim
REPO=AndoidOatmeal/dotfiles
while getopts "r" option; do
	case "${option}" in 
		r)
			REPO=${OPTARG}
		;;
	esac
done

# Clone this git repo
echo -e "Cloning 'dotfiles' repo...\n"
rm -rf "$DOTFILES_DIR"
git clone "https://github.com/${REPO}.git" "$DOTFILES_DIR"

# # Move aside any existing vim setup
# if [[ -e "$VIMRC_PATH" || -L "$VIMRC_PATH" ]]; then
#     echo -e "Moving aside old vimrc...\n"
#     current_date=$(date "+%Y%m%d%H%M%s")
#     mv -vf "$VIMRC_PATH" "${VIMRC_PATH}_old${current_date}"
# fi
# if [[ -e "$VIM_DIR" || -L "$VIM_DIR" ]]; then
#     echo -e "Moving aside old .vim/ directory...\n"
#     current_date=$(date "+%Y%m%d%H%M%s")
#     mv -vf "$VIM_DIR" "${VIM_DIR}_old${current_date}"
# fi

# # Link the new vimrc
# echo -e "Softlinking new vimrc...\n"
# ln -s "$DOTFILES_DIR/vimrc" "$VIMRC_PATH"

# # Install Vundle (auto-creates the directories)
# echo -e "Installing Vundle"
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# # Create other essential vim directories
# echo -e "Creating other vim directories...\n"
# mkdir -vp ~/.vim/{backup,tmp}

# # Install any Vundle plugins
# echo -e "Installing Vundle plugins...\n"
# vim +PluginInstall +qall

# echo -e "Setup complete"
