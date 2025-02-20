#!/bin/bash

command=htop

#[] == "test" command
# "command" checks for the existance of a command
if command -v $command
then
	echo "$command is available, let's run it..."
else
	echo "$command is not available, installing it..."
	sudo apt update && sudo apt install -y $command
fi

$command
