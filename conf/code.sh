#!/bin/bash

args=(
	/home/juser0/os/vm/code.qcow2 
	-device usb-ehci,id=ehci 
	-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 
	-name code 
	-full-screen 
	-pidfile pidcode 
	-D log/code 
	-sandbox on
)

cmd="/home/juser0/os/scripts/qemu.sh "${args[@]}""

eval $cmd $@
