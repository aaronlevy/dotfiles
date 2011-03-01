#!/usr/bin/env bash
# Taken from https://github.com/sontek/dotfiles/
for i in _*
do 
    source="${PWD}/$i"
    target="${HOME}/${i/_/.}"
    ln -sf ${source} ${target}
done
