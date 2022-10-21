#!/usr/bin/env bash

#program should retrieve a list of installed packages and cloned repos, add them to a list and allow the syncing of them between installs, will be for arch so pacman package manager to install packages. Of course git will be used for the syncing of repos


#thanks to SBRL for this handy git repo url finder
#find /home/ctome/git/ -mount -type d -name '.git' -print0 | xargs -0 -I {} bash -c 'dirgit="{}"; dir="$(dirname "${dirgit}")"; cd "${dir}" && echo -e "$(git remote -v | tr " " "\t" | cut -f 2 | head -n1)";' |grep .com > repos.txt && mkdir -p repos;

# cd repos && cat ../repos.txt |xargs -0 git clone;


# the newer way of cloning repos that you own
gh repo list --limit 100 |awk '{print $1}'  | xargs -L1 gh repo clone


# cloning repos in my stack, credit to @Epictek for the oneliner. html-xml-utils isnt maintained on fedora so we use a docker container. This is slower but should ensure it works on any distribution

# TODO fix so it loops through all pages, as it just grabs the first currently
curl -s https://github.com/stars/CrimsonTome/lists/my-stack | docker run -i jezzay/html-xml-utils hxnormalize -x |docker run -i jezzay/html-xml-utils hxselect -c '#user-list-repositories > div > div > h3' | sed -n 's/.*href="\([^"]*\).*/\1/p' | awk '{print "https://github.com"$0}'|xargs -L1 git clone
