#!/usr/bin/env bash
# Based on https://github.com/sontek/dotfiles/
for i in _*
do 
    source="${PWD}/$i"
    target="${HOME}/${i/_/.}"
    if [ -e "${target}" -a ! -h ${target} ]; then
        backup="${HOME}/.save.${i}"
        echo "${target} already exists. Moving to ${backup}"
        mv ${target} ${backup}
    fi
    ln -snf ${source} ${target}
done
