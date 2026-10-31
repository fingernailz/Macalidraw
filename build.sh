#!/usr/bin/env bash
set -euo pipefail

rm -rf upstream build
git clone --depth 1 https://github.com/excalidraw/excalidraw.git upstream

cd upstream
yarn install
yarn build
cd ..

cp -R upstream/excalidraw-app/build ./build
echo "Excalidraw build ready in ./build"
