#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

git add .
git commit -mdist
git pull origin main
git pull origin dist
branch=$(git rev-parse --abbrev-ref HEAD)
git push $branch dist
