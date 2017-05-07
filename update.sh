#!/bin/bash

VERSION=$1
BRANCH=$(git rev-parse --abbrev-ref HEAD)
FILES=Dockerfile*

if [[ -z "$VERSION" ]]; then
  echo "Usage: sh update.sh <Node version>"
  exit 1
fi

for FILE in $FILES; do
  sed -i "" -e "1 s/[0-9]\{1,\}/$VERSION/g" $FILE
done

git add $FILES
git commit -am "Update to Node $VERSION"
git push origin $BRANCH