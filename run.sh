#!/bin/bash

YARN=yarn

if ! hash yarn 2>/dev/null; then
  echo "Installing yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install yarn
fi

if [ "$WERCKER_YARN_CACHE" == "true" ]; then
  YARN="HOME=$WERCKER_CACHE_DIR $YARN"
fi

if [ "$WERCKER_YARN_PRODUCTION" == "true" ]; then
  YARN="$YARN --prod"
fi

if [ "$WERCKER_YARN_PURE_LOCKFILE" == "true" ]; then
  YARN="$YARN --pure-lockfile"
fi

YARN="$YARN $WERCKER_YARN_OPTIONS"

echo "$YARN"
eval "$YARN"

export PATH="$PATH:`yarn global bin`"
