#!/bin/bash
# Helper script to run SILE with frontmatter package via Docker
# Uses custom frontmatter-sile image with pre-installed dependencies

set -e

IMAGE_NAME="frontmatter-sile"

# Check if custom image exists, if not provide build instructions
if ! docker images | grep -q "^${IMAGE_NAME}"; then
  echo "Error: Docker image '${IMAGE_NAME}' not found."
  echo ""
  echo "Please build the image first:"
  echo "  docker build -t ${IMAGE_NAME} ."
  echo ""
  exit 1
fi

# Run SILE with our custom image
docker run --rm --volume "$(pwd):/data" ${IMAGE_NAME} "$@"
