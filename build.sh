#!/bin/sh
set -e
cd "$(dirname "$0")"
mkdir -p dist && cp index.html art.js dist/
[ "$1" = "--no-open" ] || open dist/index.html
