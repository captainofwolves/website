#!/bin/sh

SITEPATH='/home/ofwolves'

# remove the current code folder
rm -rf $SITEPATH/code/*
rm -rf $SITEPATH/code/.git

# grab master
git clone http://github.com/captainofwolves/website.git $SITEPATH/code

# ideally we'd have used git archive export, but github doesn't support it
# clean the repo
rm -rf $SITEPATH/code/www/.git*

# get rid of anything in there... maybe a bit extreme
rm -rf $SITEPATH/public_html/*

# copy all the www code to live
cp -r $SITEPATH/code/www/* $SITEPATH/public_html

# replace this script too
mv $SITEPATH/build.sh $SITEPATH/build.sh.bk && cp $SITEPATH/code/build.sh $SITEPATH/build.sh
