#!/usr/bin/env bash
set -Eeuo pipefail

if [ -z "$(git status --porcelain)" ]; then 
	# Working directory clean
	echo "Doing a dry run..."
	npx standard-version --dry-run
	read -p "Does that look good? [y/N] " -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# do dangerous stuff
		npx standard-version
		git push --follow-tags origin master
	else
		echo "okay, never mind then..."
		exit 2
	fi
else 
	echo "Can't create release, working tree unclean..."
	exit 1
fi
