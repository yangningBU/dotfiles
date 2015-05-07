if [ -z $1 ]; then
    echo "You need a branch to change into."
else
    ~/dotfiles/branch.sh > ~/dotfiles/`~/dotfiles/repo.sh`_last_branch && git checkout $1
fi
