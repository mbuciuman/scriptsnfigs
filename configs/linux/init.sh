#!/usr/bin/bash

CONFIG_PATH=$(pwd)
while getopts 'f' flag; do
	case "${flag}" in
		f) force='true' ;;
		*) error "Unexpected option ${flag}" ;;
	esac
done
for f in $(/usr/bin/ls -A $CONFIG_PATH); do
	if [ "$f" != "init.sh" ]; then
		if [ "$force" = true ]; then
			echo "Overwriting and creating symlink of $f in home dir..."
			sudo ln -sfn "${CONFIG_PATH}/${f}" -t "$HOME" 
		else
			echo "Creating symlink of $f in home dir..."
			sudo ln -sn "${CONFIG_PATH}/${f}" -t "$HOME"
		fi
				
	fi
done
echo "Configs linked!"
