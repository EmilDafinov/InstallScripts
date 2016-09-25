#!/usr/bin/env bash

#Some useful git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'

#This one is trickier: allows you to do 'git review [name-of-remote-that-is-the-PR-target] [PR#]'
#Doing so will pull the PR branch and check it out without creating a local branch.
#That way you can review the branch in your IDE and not have useless ephemeral branches cluttering up your local workspace
git config --global alias.review '!f(){ git fetch $1 pull/$2/head;git checkout FETCH_HEAD;}; f'