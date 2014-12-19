export PATH=/usr/local/bin:$PATH
export PATH="$HOME/Downloads/ExcelCompare-0.4.1/bin":$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export PATH=$JAVA_HOME/bin:$PATH
export M2_HOME=/usr/local/Cellar/maven/3.2.3/libexec
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"
export PATH=$M2:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export ZSH=~/dotfiles/.oh-my-zsh

# bindkey "^[[1;3C" forward-word # alt + ->
# bindkey "^[[1;3D" backward-word # alt + <-

bindkey '[C' forward-word # alt + ->
bindkey '[D' backward-word # alt + <-
