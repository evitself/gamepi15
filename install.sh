#!/bin/bash

# build fbcp-ili9341
build_fbcp() {
    echo "build fbcp-ili9341"
    local FBCPDIR="$(pwd)/fbcp-ili9341/"
    if [ -d "$FBCPDIR/build/" ]; then
        rm -rf $FBCPDIR/build/
    fi
    mkdir -p $FBCPDIR/build/
    sudo apt-get install cmake -y
    pushd $FBCPDIR/build/
    cmake -DWAVESHARE_ST7789VW_HAT=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DSTATISTICS=0 -DBACKLIGHT_CONTROL=OFF ..
    make -j
    sudo install fbcp-ili9341 /usr/local/bin/fbcp-ili9341
    popd
}

copy_config() {
    sudo cp -rf ./retropie/* /
}

build_fbcp
copy_config

echo "rebooting..."
sudo reboot
