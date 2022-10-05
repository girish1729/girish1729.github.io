#!/bin/sh

if [ "$*" = "" ]; then
	echo "Please provide commit message...aborting"
	exit
fi
cd hugo-source/site
hugo --themesDir ../.. --destination ../..
cd ../..
git add *
git commit -m "$*" -a
git push
