#!/bin/bash

# author	mintarchit
# description	init new virtual machine	
# version	1.0


# vminit.sh	$1	     $2	      $3
# vminit.sh [[vm-name]] [[vm-size]] [[iso]]

# eg. 
# vminit.sh test-machine 40G iso/ubuntu22.04

# $1 vm name, $2 vm size

conf="conf/$1.sh"
os="$HOME/hub/os"
scripts="$os/scripts"

[ ! -d "$scripts" ] && mkdir $os/scripts
[ ! -d "$os/conf" ] && mkdir $os/conf
[ ! -d "$os/vm" ] && mkdir $os/vm
[ ! -d "$os/iso" ] && mkdir $os/iso
[ ! -d "$os/log" ] && mkdir $os/log

img_args=(
	-f qcow2
	$os/vm/$1.qcow2
	$2
)

cmd="qemu-img create "${img_args[@]}""
create_script="#!/bin/bash\n\nargs=(\n\t$os/vm/$1.qcow2 \n\t-device usb-ehci,id=ehci \n\t-device usb-host,bus=ehci.0,vendorid=0x2109,productid=0x0715 \n\t-name $1 \n\t-full-screen \n\t-pidfile pid$1 \n\t-D log/$1 \n\t-sandbox on\n)\n\ncmd=\"$scripts/qemu.sh \"\${args[@]}\"\"\n\neval \$cmd \$@"

echo "Creating virtual machine \"vm/$1.qcow2\"" | lolcat -a -d 16
eval "$cmd"
echo "Creating machine conf\"$conf\"" | lolcat -a -d 16
echo -e "$create_script" > "$os/$conf"

chmod +x "$os/$conf"
# read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

[ ! -z "$3" ] && eval "$scripts/install.sh $os/$conf $3"
