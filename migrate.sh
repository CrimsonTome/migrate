#!/usr/bin/bash

#program should retrieve a list of installed packages and cloned repos, add them to a list and allow the syncing of them between installs, will be for arch so pacman package manager to install packages. Of course git will be used for the syncing of repos


#thanks to SBRL for this handy git repo url finder
find /home/ctome/git/ -mount -type d -name '.git' -print0 | xargs -0 -I {} bash -c 'dirgit="{}"; dir="$(dirname "${dirgit}")"; cd "${dir}" && echo -e "$(git remote -v | tr " " "\t" | cut -f 2 | head -n1)";' |grep .com > repos.txt && mkdir -p repos;

cd repos && cat ../repos.txt |xargs -0 git clone;
