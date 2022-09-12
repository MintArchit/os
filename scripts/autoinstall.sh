#!/bin/bash

# author	mintarchit
# description	ubuntu server auto install
# version	1.0

#      ./autoinstall.sh [[vm name]] [[vm size]] [[os]]
# e.g. ./autoinstall.sh test-machine 40G 	iso/ubuntu22.04.live-server.iso

os="$HOME/os"
cloud="$os/cloud"

[ ! -d "$cloud" ] && mkdir -p "$cloud"

cat > "$cloud/user-data" << 'EOF'
#cloud-config
autoinstall
	version: 1
	identity:
		hostname: ubuntu-server
		password: "$6$exDY1mhS4KUYCE/2$zmn9ToZwTKLhCw.b4/b.ZRTIZM30JZ4QrOQ2aOXJ8yk96xpcCof0kxKwuX1kqLG/ygbJ1f8wxED22bTL4F46P0"
		username: ubuntu
EOF
touch "$cloud/meta-data"

cloud-localds $cloud/seed.iso $cloud/user-data $cloud/meta-data

cmd="$os/scripts/vminit.sh $1 $2 $3 $cloud/seed.iso"

eval "$cmd"
echo "$cmd" | lolcat
