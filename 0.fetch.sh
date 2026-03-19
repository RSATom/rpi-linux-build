#!/bin/bash -e

pushd "$(dirname "$0")" > /dev/null

if [ ! -d "linux" ]; then
	echo Fetching Linux kernel sources...
	git clone https://github.com/raspberrypi/linux.git
fi

popd > /dev/null
