#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

git add .
git commit -mdist || true
git fetch --unshallow
git pull

merge() {
  if [[ "$branch" != "$1" ]]; then
    git fetch origin $1
    git merge origin/$1 --no-edit
    git add . && git commit -m"merge $1" || true
  fi
}

merge main
merge dist

git push || true

branch=$(git rev-parse --abbrev-ref HEAD)

git push origin $branch:dist
