#!/bin/bash

release_file=/etc/os-release

if grep -q "Arch" $release_file
then 
	# The host is based on Arch, run the pacman update command
	sudo pacman -Syu
fi

if  grep -q "ubuntu" $release_file || grep -q "debian" $release_file
then
	# The host is running on Debian or Ubuntu,
	# Run the apt version of the command
	sudo apt update
	sudo apt dist-upgrade
	sudo apt autoremove
fi
