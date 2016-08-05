# dotfiles
This is how I stay alive... on various machines.

Install with `curl -s https://raw.githubusercontent.com/yangningBU/dotfiles/master/dotfile-control.sh | bash -`

You will notice there is a forked powerline.py from [powerline](https://github.com/milkbikis/powerline-bash) here as well.

You can use the patched font included in this repo [Monaco For Powerline](Monaco-Powerline.otf) or create your own patched font to use. You will need the fontpatcher script and patched symbol files, create them with
- `curl -s https://raw.githubusercontent.com/Lokaltog/vim-powerline/develop/fontpatcher/fontpatcher > ~/fontpatcher`
- `curl -s https://raw.githubusercontent.com/Lokaltog/vim-powerline/develop/fontpatcher/PowerlineSymbols.sfd > ~/PowerlineSymbols.sfd`, 

making sure to `chmod +x ~/fontpatcher` before running the relevant command in [the instructions](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher#os-x).
