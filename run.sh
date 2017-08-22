#!/bin/bash

YARN="$HOME/.yarn/bin/yarn"
if hash yarn 2>/dev/null; then
  YARN=$(which yarn)
fi

if ! [ -x $YARN]; then
  echo "Installing yarn..."
  curl -o- -L https://yarnpkg.com/install.sh | bash
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
