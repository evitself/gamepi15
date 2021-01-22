#!/bin/sh

# build fbcp-ili9341
build_fbcp() {
    echo "build fbcp-ili9341"
    local FBCPDIR="$(PWD)/fbcp-ili9341/"
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

# build retrogame
build_retrogame() {
    echo "build retrogame"
    local RGDIR="$(PWD)/Retrogame/"
    pushd $RGDIR
    make clean
    make retrogame
    sudo install retrogame /usr/local/bin/retrogame
    popd
}

copy_config() {
    sudo cp -rf ./retropie/* /
}

sudo mkdir -p /opt/retropie/configs/psx/pcsx/
sudo mkdir -p /etc/modprobe.d/
sudo cp -rf ./etc/modules /etc/modules
sudo cp -rf ./opt/retropie/configs/* /opt/retropie/configs/
sudo cp ./etc/udev/rules.d/10-retrogame.rules /etc/udev/rules.d/
	# fi

	# echo "1" > ./boot/mark

	sudo apt-get install cmake -y
	sudo rm ./rpi-fbcp/build/CMakeCache.txt
	cd ./rpi-fbcp/build/
	sudo cmake ..
	sudo make
	sudo install fbcp /usr/local/bin/fbcp
	cd ../../
	sudo mkdir -p /usr/share/X11/xorg.conf.d

# elif test "$var1" = "0" -a "$1" = "lite" ;then
# 	echo "1" > ./boot/mark
# 	echo "No touch driver installled"
# 	echo "No fbcp driver installled"
# 	sudo mkdir -p /usr/share/X11/xorg.conf.d
# fi

# if test "$j" != "kali" ;then
# 	if test "$1" != "lite" -a "$2" != "lite" ;then
		sudo cp -rf ./usr/share/X11/xorg.conf.d/99-fbturbo.conf-HDMI  /usr/share/X11/xorg.conf.d/99-fbturbo.conf
# 	else
# 		sudo cp -rf ./usr/share/X11/xorg.conf.d/99-fbturbo.conf  /usr/share/X11/xorg.conf.d/99-fbturbo.conf
# 	fi
# else
# 	sudo cp ./usr/share/X11/xorg.conf.d/99-fbturbo.conf-kali /usr/share/X11/xorg.conf.d/99-fbturbo.conf
# fi

sudo cp ./etc/modules /etc/

sudo cp ./usr/local/bin/retrogame /usr/local/bin/
sudo cp ./boot/retrogame.cfg-154 /boot/retrogame.cfg

sudo cp -rf ./etc/rc.local-154 /etc/rc.local


# if test "$1" = "0" -o "$#" = "0" -o "$2" = "0";then
	sudo cp -rf ./etc/X11/xorg.conf.d/99-calibration.conf-154  /usr/share/X11/xorg.conf.d/99-calibration.conf
	sudo cp ./boot/config-154.txt /boot/config.txt
	echo "LCD configrue 0"
# elif test "$1" = "lite" -a "$#" = "1" ;then
#         sudo cp -rf ./etc/X11/xorg.conf.d/99-calibration.conf-154  /usr/share/X11/xorg.conf.d/99-calibration.conf
#         sudo cp ./boot/config-154.txt /boot/config.txt
#         echo "LCD configrue 0"
# elif test "$1" = "90" -o "$2" = "90";then
# 	if test "$1" = "lite" -o "$2" = "lite" -o "$j" = "kali" ; then
# 	sudo cp ./boot/config-154.txt /boot/config.txt
# 	sudo cp -rf ./etc/rc.local-154-90 /etc/rc.local
# 	else
# 	sudo cp ./boot/config-154.txt-90 /boot/config.txt
# 	fi
# 	sudo cp -rf ./etc/X11/xorg.conf.d/99-calibration.conf-154-90  /usr/share/X11/xorg.conf.d/99-calibration.conf
# 	echo "LCD configrue 90"
# fi

# if [ -b /dev/mmcblk0p7 ]; then
# sudo cp ./cmdline.txt-noobs /boot/cmdline.txt
# else
sudo cp ./cmdline.txt /boot/
# fi

sudo cp ./inittab /etc/


# if test "$#" = "0" -o "$1" = "0" -o "$1" = "90" -o "$2" = "0" -o "$2" = "90" -o "$1" = "lite" -o "$2" = "lite" ; then
sudo reboot
# echo "reboot now"
# else
# echo "Invalid parameter,Usage:LCD154-show [0] [90] [lite]"
# fi

# cd ../

# fi


# if test "$j" = "RECALBOX" ;then

# echo "$j"

# mount -o remount,rw /
# mount -o remount,rw /boot

# mkdir -p /lib/modules/4.14.62/extra/

# cp ./recalbox/mk_arcade_joystick_rpi.ko /lib/modules/4.14.62/extra/

# cp ./recalbox/etc/modules.conf-154 /etc/modules.conf
# cp ./recalbox/boot/config.txt-154 /boot/config.txt
# cp ./recalbox/etc/modprobe.d/fbtft.conf-154 /etc/modprobe.d/fbtft.conf

# cp ./recalbox/etc/init.d/rcS-154 /etc/init.d/rcS

# cp ./recalbox/recalbox/share/system/recalbox.conf-154  /recalbox/share/system/recalbox.conf

# reboot

# fi
