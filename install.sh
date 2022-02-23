#!/usr/bin/env bash
for i in _*
do
    source="${PWD}/$i"
    target="${HOME}/${i/_/.}"
    if [ -e "${target}" -a ! -h ${target} ]; then
        backup="${HOME}/${i}.bak"
        echo "${target} already exists. Moving to ${backup}"
        mv ${target} ${backup}
    fi
    ln -snf ${source} ${target}
done
git submodule init
git submodule update
# vim -c 'GoInstallBinaries|q'
