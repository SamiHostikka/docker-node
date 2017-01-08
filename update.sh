#!/bin/bash

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: sh update.sh <Node version>"
  exit 1
fi

if git show-ref --quiet --verify -- "refs/remotes/origin/$VERSION"; then
  echo "$VERSION exists already"
  exit 1
fi

git checkout -b $VERSION

sed -i "s/slim/$VERSION-slim/g" Dockerfile
sed -i "s/latest/$VERSION/g" onbuild/Dockerfile

git commit -am "Update to Node $VERSION"
git push origin "$VERSION"
git checkout master
