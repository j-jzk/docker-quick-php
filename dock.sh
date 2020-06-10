#!/usr/bin/bash

NAME=testing-container

showHelp() {
	echo "-h	shows this help"
	echo "-b	rebuilds the container"
	echo "-d	run as a daemon"
	exit
}

rebuild() {
	echo "Building the container."
	docker build -t $NAME .
}

for arg in "$@"; do
	case $arg in
		"-h") showHelp;;
		"-b") rebuild;;
		"-d") daemon="-d";;
	esac
done


docker run $daemon -p 8080:80 -v "$(pwd)/src":/var/www/html $NAME