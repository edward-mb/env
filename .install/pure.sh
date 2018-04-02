#!/bin/sh

set -e
source ./.versions

echo
echo "Installing pure-prompt for zsh..."
echo

apk add --no-cache --virtual .build-deps \
	curl

mkdir -p /usr/local/share/zsh/site-functions
curl -fLo /usr/local/share/zsh/site-functions/prompt_pure_setup \
	https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh
curl -fLo /usr/local/share/zsh/site-functions/async \
	https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh

apk del .build-deps
