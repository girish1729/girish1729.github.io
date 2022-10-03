#!/bin/sh

cd hugo-source/site
hugo --themesDir ../.. --destination ../..
git commit -m "$*" -a
git push
