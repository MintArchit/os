#!/bin/bash

os="$HOME/ghub/os"
args=(
	$os/vm/server.qcow2 
	-device usb-ehci,id=ehci 
	-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 
	-name server 
	-full-screen 
	-pidfile pidserver 
	-D log/server 
	-sandbox on
)

cmd="$os/scripts/qemu.sh "${args[@]}""

eval $cmd $@
