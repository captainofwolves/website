#!/bin/sh

#git pull origin master

git archive --format=tar --remote=https://github.com/captainofwolves/website.git master | tar -xf -
