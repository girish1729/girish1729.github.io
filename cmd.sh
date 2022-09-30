#!/bin/sh

pandoc --metadata title="Home of Girish Venkatachalam" --standalone -f markdown index.md -t html > index.html
