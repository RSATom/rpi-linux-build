#!/bin/bash -e

. ./env.sh

pushd "$(dirname "$0")" > /dev/null

if [ -d "dist" ]; then
	echo Do dist cleanup ...
	rm -rf ./dist
fi

mkdir -p ./dist/boot/overlays/

. ./1.build.sh

pushd ./linux > /dev/null

echo Preparing dist ...
make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=../dist/usr modules_install
cp ./arch/arm64/boot/Image ../dist/boot/$KERNEL.img
cp ./arch/arm64/boot/dts/broadcom/*.dtb ../dist/boot/
cp ./arch/arm64/boot/dts/overlays/*.dtb* ../dist/boot/overlays/
cp ./arch/arm64/boot/dts/overlays/README ../dist/boot/overlays/

popd > /dev/null
popd > /dev/null
