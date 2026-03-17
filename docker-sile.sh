#!/bin/bash
# Helper script to run SILE with frontmatter package via Docker
# This script installs required dependencies and runs SILE

set -e

# Install YAML library if not already installed
docker run --entrypoint sh --volume "$(pwd):/data" siletypesetter/sile:latest -c \
  "luarocks list | grep -q tinyyaml || luarocks install api7-lua-tinyyaml > /dev/null 2>&1; cd /data && sile $@"
