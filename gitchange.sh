#!/bin/bash
if [ -z "$1" ]; then
    loc=''
else
    loc="$1"
fi
if [ -z "$GITHOME" ]; then
    GITHOME=$HOME/git
fi
cd $GITHOME/$1
