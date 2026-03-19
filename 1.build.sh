#!/bin/bash -e

. ./env.sh
. ./0.fetch.sh

pushd "$(dirname "$0")"/linux > /dev/null

echo Building kernel ...
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2711_defconfig
make ARCH=arm64 -j$(nproc) CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs

popd > /dev/null
