#!/bin/bash

args=(
	/home/juser0/os/vm/win10.qcow2 
	-device usb-ehci,id=ehci 
	-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 
	-name win10 
	-full-screen 
	-pidfile pidwin10 
	-D log/win10 
	-sandbox on
)

cmd="/home/juser0/os/scripts/qemuwin.sh "${args[@]}""

eval $cmd $@
