#!/bin/bash

args=(
	-enable-kvm
	-boot menu=on
	-m 12G
	-cpu host
	-smp sockets=1,cores=4,threads=2
	-vga virtio
	-display sdl,gl=on
	-soundhw all
	-drive file=$@
)

cmd="qemu-system-x86_64 ${args[@]}"

eval "$cmd"
echo "$cmd" | lolcat
