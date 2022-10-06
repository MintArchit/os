#!/bin/bash

os="$HOME/ghub/os"
args=(
	$os/vm/shopping.qcow2 
	-device usb-ehci,id=ehci 
	-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 
	-name shopping 
	-full-screen 
	-pidfile pidshopping 
	-D log/shopping 
	-sandbox on
)

cmd="$os/scripts/qemu.sh "${args[@]}""

eval $cmd $@
