#!/bin/bash

os="$HOME/ghub/os"
args=(
	$os/vm/uni.qcow2 
	-device usb-ehci,id=ehci 
	-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 
	-name uni 
	-full-screen 
	-pidfile piduni 
	-D log/uni 
	-sandbox on
)

cmd="$os/scripts/qemu.sh "${args[@]}""

eval $cmd $@
