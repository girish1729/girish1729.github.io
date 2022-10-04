#!/bin/sh

cd hugo-source/site
hugo --themesDir ../.. --destination ../..
cd ../..
git add *
git commit -m "$*" -a
git push
