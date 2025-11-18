#!/bin/bash

set -e

IMAGE_NAME="ghcr.io/mkorenko/google-nest-telegram-sync:latest"

echo "🔐 Logging in to ghcr.io..."
docker login ghcr.io
echo ""

echo "🧼 Removing local image if exists..."
docker rmi -f $IMAGE_NAME || true
echo ""

echo "🔨 Building and pushing multi-platform image..."
docker buildx build --platform linux/amd64 -t $IMAGE_NAME --push .
echo ""

echo "✅ Done!"
echo ""

echo "⚠️ Please visit:"
echo "https://github.com/mkorenko/google-nest-telegram-sync/pkgs/container/google-nest-telegram-sync/versions"
echo "to delete old versions"
