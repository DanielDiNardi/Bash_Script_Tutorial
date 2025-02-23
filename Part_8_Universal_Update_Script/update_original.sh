#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then 
	# The host is based on Arch, run the pacman update command
	sudo pacman -Syu 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ]
	then
		echo "An error occurred, please check the $errorlog file."
	fi
fi

if  grep -q "ubuntu" $release_file || grep -q "debian" $release_file
then
	# The host is running on Debian or Ubuntu,
	# Run the apt version of the command
	sudo apt update 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ]
	then
		echo "An error occurred, please check the $errorlog file."
	fi
	sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ]
	then
		echo "An error occurred, please check the $errorlog file."
	fi
	sudo apt autoremove -y 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ]
	then
		echo "An error occurred, please check the $errorlog file."
	fi
fi
