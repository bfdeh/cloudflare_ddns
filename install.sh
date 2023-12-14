#!/bin/bash

SCRIPT_DIR=$(dirname $0)

function usage()
{
	echo "usage: $0 <install|uninstall>"
	exit 1
}

function install()
{
	sudo mkdir /opt/cloudflare_ddns
	sudo cp "$SCRIPT_DIR/src/cloudflare_ddns" /opt/cloudflare_ddns/
	sudo cp "$SCRIPT_DIR/src/cloudflare_ddns.conf" /opt/cloudflare_ddns/
	sudo cp "$SCRIPT_DIR/src/cloudflare_ddns.service" /etc/systemd/system/
	sudo systemctl enable cloudflare_ddns.service
	cat <<- EOF
	To start this ddns client, modify the config file '/opt/cloudflare_ddns/cloudflare_ddns.conf',
	and then execute 'sudo systemctl start cloudflare_ddns.service'.
	EOF
}

function uninstall()
{
	sudo systemctl stop cloudflare_ddns.service
	sudo systemctl disable cloudflare_ddns.service
	sudo rm -f /etc/systemd/system/cloudflare_ddns.service
	sudo rm -fr /opt/cloudflare_ddns/
}

if [ "$1" = "install" ]; then
	install
elif [ "$1" = "uninstall" ]; then
	uninstall
else
	usage
fi
