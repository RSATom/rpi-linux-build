#!/bin/bash -e

if [ -z "$1" ]; then
    echo "Target host is required."
    exit 1
fi

. ./2.make-dist.sh

pushd "$(dirname "$0")" > /dev/null

rsync --recursive --keep-dirlinks --links --safe-links --info=progress2 --rsync-path="sudo rsync" ./dist/ $1:/

popd > /dev/null
