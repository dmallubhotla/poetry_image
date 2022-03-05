#!/usr/bin/env bash
set -Eeuo pipefail

if [ -z "$(git status --porcelain)" ]; then 
	# Working directory clean
	echo "Doing a dry run..."
	npx standard-version --dry-run
	read -p "Create commit for version $version? " -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# do dangerous stuff
		echo "This is where it would be"
	else
		echo "okay, never mind then..."
		exit 2
	fi
else 
	echo "Can't create release, working tree unclean..."
	exit 1
fi
