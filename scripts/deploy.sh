#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -f ".env" ]; then
  echo "ERROR: töltsd ki az .env fájlt (.env.example alapján)!"
  exit 1
fi

echo "[1/3] Pull images…"
docker compose pull

echo "[2/3] Start / recreate…"
docker compose up -d

echo "[3/3] Prune old images (opcionális)…"
docker image prune -f

echo "✅ Kész. Stack fut:"
docker compose ps
