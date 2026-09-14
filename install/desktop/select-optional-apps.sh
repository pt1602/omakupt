#!/bin/bash

if [[ -v OMAKUPT_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUPT_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMAKUPT_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
