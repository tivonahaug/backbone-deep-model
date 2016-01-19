#!/bin/bash

npm install
npm dedupe

if [[ -n "$UNDERSCORE" ]]
then
	npm install underscore@"$UNDERSCORE"
fi

if [[ -n "$BACKBONE" ]]
then
	npm install backbone@"$BACKBONE"
fi

if [[ -n "$LODASH" ]]
then
	npm install lodash@"$LODASH"
	rm -Rf node_modules/underscore
	cp -Rf node_modules/lodash node_modules/undescore

	# Lodash@2 and Lodash@3 have different file structures
	if [[ "$LODASH" < "3.0" ]]
	then
		rm -Rf node_modules/underscore
		cp -Rf node_modules/lodash node_modules/undescore
	else
		#mv node_modules/lodash/index.js node_modules/underscore/underscore.js
	fi
fi
