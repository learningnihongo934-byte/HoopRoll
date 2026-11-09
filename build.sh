#!/bin/sh
# ./build.sh            build dist/ and open it
# ./build.sh --no-open  build only
# ./build.sh deploy     build, then publish to https://hooproll.rennko.tech (Cloudflare Workers)
set -e
cd "$(dirname "$0")"
mkdir -p dist && cp index.html art.js dist/
case "$1" in
  deploy) npx -y wrangler@4 deploy ;;
  --no-open) ;;
  *) open dist/index.html ;;
esac
