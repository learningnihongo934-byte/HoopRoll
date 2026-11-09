#!/bin/sh
set -e
cd "$(dirname "$0")"
mkdir -p dist && cp index.html dist/
[ "$1" = "--no-open" ] || open dist/index.html
