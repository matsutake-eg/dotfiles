#!/bin/zsh
while read line; do
code --install-extension "$line"
done < list-extensions.txt
