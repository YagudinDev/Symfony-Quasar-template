#!/usr/bin/env sh
set -eu

cd /app
npm ci --no-audit --no-fund --legacy-peer-deps
npm run dev -- --host 0.0.0.0 --port 9000
