#!/bin/bash
# This script will clone the specified GitHub repo at the standard destination
# under $WORKSPACE_ROOT

set -euo pipefail

WORKSPACE_ROOT=$HOME/dev/github
PATH_ONLY_MODE="${PATH_ONLY_MODE:-false}"

if [[ $# != 1 ]]; then
  echo "Usage: $0 repo_url"
  exit 1
fi


REPO_URL=$1
LOCAL_PATH=""
if [[ $REPO_URL = git@github.com:* ]] ; then
  LOCAL_PATH=$( echo $REPO_URL | sed 's/git@github.com://' | sed 's/.git//' )
elif [[ $REPO_URL = https://github.com/* ]] ; then
  LOCAL_PATH=$( echo $REPO_URL | sed 's#https://github.com/##' | sed 's/.git//'  )
else
  LOCAL_PATH=$REPO_URL
  REPO_URL=git@github.com:$REPO_URL.git
  if [[ $PATH_ONLY_MODE != "true" ]]; then
    echo "Short naming. Falling back to cloning $REPO_URL"
  fi
fi

TARGET=$WORKSPACE_ROOT/$LOCAL_PATH

if [[ $PATH_ONLY_MODE == "true" ]]; then
  echo "$TARGET"
  exit 0
fi

if $( test -d "$TARGET" ) ; then
  echo "Already existing, nothing to do."
  exit 0
fi

mkdir $TARGET
git clone $REPO_URL $TARGET
