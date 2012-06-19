#!/bin/sh

#git pull origin master

#git archive --format=tar --remote=https://github.com/captainofwolves/website.git master | tar -xzf -

# script is called from www folder
#cd ../

#curl https://github.com/captainofwolves/website/tarball/master | tar xz

rm -rf /home/ofwolves/code/*
rm -rf /home/ofwolves/code/.git

env GIT_SSL_NO_VERIFY=true git clone https://github.com/captainofwolves/website.git /home/ofwolves/code

rm -rf /home/ofwolves/code/www/.git*
rm -rf /home/ofwolves/public_html/*

cp -r /home/ofwolves/code/www/* /home/ofwolves/public_html

# wget http://shortlist.footystreak.com/images/euro2012/FS_Logo.png