#!/bin/sh
# Builds dist/ from src/game.html + src/players.js + art.js.
#   ./build.sh          build and open it
#   ./build.sh serve    build, then serve at http://localhost:8840
#   ./build.sh deploy   build, then publish to https://hooproll.rennko.tech (Cloudflare Workers)
set -e
cd "$(dirname "$0")"
mkdir -p dist
python3 - <<'PY'
html=open("src/game.html").read()
open("dist/index.html","w").write(html.replace("/*PLAYERS*/",open("src/players.js").read()))
PY
cp art.js dist/
echo "Built dist/"
case "$1" in
  deploy) npx -y wrangler@4 deploy ;;
  serve) python3 -m http.server 8840 --directory dist ;;
  --no-open) ;;
  *) open dist/index.html ;;
esac
