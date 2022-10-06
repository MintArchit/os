#!/bin/bash

os="$HOME/ghub/os"

args=(
	$os/vm/mail.qcow2 
	-device usb-ehci,id=ehci 
	-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 
	-name mail 
	-full-screen 
	-pidfile pidmail 
	-D log/mail 
	-sandbox on
)

cmd="$os/scripts/qemu.sh "${args[@]}""

eval $cmd $@
