#!/usr/bin/env bash
URL="https://github.com/greg7mdp/sparsepp/archive/refs/heads/master.zip"
ZIP="${URL##*/}"
DIR="sparsepp-master"
mkdir -p .build
cd .build

# Download the release
if [ ! -f "$ZIP" ]; then
  echo "Downloading $ZIP from $URL ..."
  curl -L "$URL" -o "$ZIP"
  echo ""
fi

# Unzip the release
if [ ! -d "$DIR" ]; then
  echo "Unzipping $ZIP to .build/$DIR ..."
  cp "$ZIP" "$ZIP.bak"
  unzip -q "$ZIP"
  rm "$ZIP"
  mv "$ZIP.bak" "$ZIP"
  echo ""
fi
cd ..

# Copy the libs to the package directory
echo "Copying libs to sparsepp/ ..."
rm -rf sparsepp/
cp -rf ".build/$DIR/sparsepp" ./sparsepp
echo ""
