#!/usr/bin/env bash
set -euo pipefail

SHA="${UPSTREAM_SHA:-HEAD}"

rm -rf upstream build
mkdir upstream
git -C upstream init -q
git -C upstream remote add origin https://github.com/excalidraw/excalidraw.git
git -C upstream fetch --depth 1 origin "$SHA"
git -C upstream checkout -q FETCH_HEAD

cd upstream
yarn install --frozen-lockfile
yarn build
cd ..

cp -R upstream/excalidraw-app/build ./build
echo "Built Excalidraw at $(git -C upstream rev-parse HEAD)"
