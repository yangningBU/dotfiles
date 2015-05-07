#!/bin/bash
repo=`basename "$(git rev-parse --show-toplevel)"`
current_branch=`git rev-parse --abbrev-ref HEAD`
echo "$repo".git:"$current_branch"
