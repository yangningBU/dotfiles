# dotfiles
This is how I stay alive... on various machines.

## Just Vim Setup

If you just want the vim pimp:
- install Vundle with
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
- then copy my .vimrc file to ~/.vimrc on your computer
- open vim and install the Vundle packages with `:VundleInstall`
- then exit and go back into vim and everything should be peachy keen

## Whole Env

If you want the whole environment which includes nifty aliases and shortcuts you can install my env setup.

Install with
```
curl -s https://raw.githubusercontent.com/yangningBU/dotfiles/master/dotfile-control.sh | bash -
```

You will notice there is a forked powerline.py from [powerline](https://github.com/milkbikis/powerline-bash) here as well.

You can use the patched font included in this repo [Monaco For Powerline](Monaco-Powerline.otf) or create your own patched font to use. You will need the fontpatcher script and patched symbol files, create them with
- `curl -s https://raw.githubusercontent.com/Lokaltog/vim-powerline/develop/fontpatcher/fontpatcher > ~/fontpatcher`
- `curl -s https://raw.githubusercontent.com/Lokaltog/vim-powerline/develop/fontpatcher/PowerlineSymbols.sfd > ~/PowerlineSymbols.sfd`, 

making sure to `chmod +x ~/fontpatcher` before running the relevant command in [the instructions](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher#os-x).
