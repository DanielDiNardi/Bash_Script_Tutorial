#!/bin/bash

directory=/etc

if [ -d $directory ]
then
	echo "The directory $directory exists."
	exit 0
else
	echo "The directory $directory doesn't exist."
	exit 199
fi

echo "The exit code for this script is: $?"
echo "You didn't see that statement."
echo "You won't see this one either."
