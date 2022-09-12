#!/bin/bash

args=(
	-no-reboot
	-cdrom $2
	$3
)

prefix="$1"
cmd="$prefix "${args[@]}""

eval $cmd
# after install restart without cdrom
# eval $prefix
