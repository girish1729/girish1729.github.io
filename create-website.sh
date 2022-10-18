#!/bin/sh

if [ "$*" = "" ]; then
	echo "Please provide commit message...aborting"
	exit
fi
set -x
cd hugo-source
rm -rf resources
hugo --gc --minify --destination ../..
cd ..
git add *
git commit -m "$*" -a
git push
