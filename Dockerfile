# Dockerfile for SILE with sile-frontmatter dependencies
# Extends official SILE image with YAML parsing support

FROM siletypesetter/sile:latest

# Install YAML parsing library
RUN luarocks install api7-lua-tinyyaml

# Set working directory
WORKDIR /data

# Default command runs SILE
ENTRYPOINT ["sile"]
