#!/bin/bash

YARN="$HOME/.yarn/bin/yarn"

echo "Installing yarn..."
curl -o- -L https://yarnpkg.com/install.sh | bash

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
