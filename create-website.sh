#!/bin/sh

cd hugo-source/site
hugo --themesDir ../.. --destination ../..
git add *
git commit -m "$*" -a
git push
