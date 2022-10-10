#!/bin/sh

if [ "$*" = "" ]; then
	echo "Please provide commit message...aborting"
	exit
fi
cd hugo-source
hugo --gc --minify --destination ../..
cd ..
git add *
git commit -m "$*" -a
git push
