#!/usr/bin/env sh
set -e;

if [ ! -d "upstream" ]; then
  echo "Cloning CrealityPrint repository into the 'upstream' subfolder..."
  git clone https://github.com/CrealityOfficial/CrealityPrint.git upstream
fi

cd upstream

echo "Fetching latest changes..."
git pull

echo "Applying patches..."
for patch in ../patches/*.patch; do
  echo "Applying $patch"
  git apply "$patch"
done
