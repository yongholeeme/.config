#!/bin/sh

if [ -f "./pnpm-lock.yaml" ]; then
  pnpm "$@"
elif [ -f "./package-lock.json" ]; then
  npm "$@"
else
  echo "Neither pnpm nor npm lockfile found, use pnpm"
  pnpm "$@"
fi