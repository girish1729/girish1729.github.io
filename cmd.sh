#!/bin/sh

pandoc --metadata title="Home of Girish Venkatachalam" --standalone -f markdown index.md -t html > index.html
echo $*
git commit -m "$*" -a
git push
