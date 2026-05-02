# Dockerfile for SILE with frontmatter.sile dependencies
# Extends official SILE image with YAML parsing and markdown support

FROM siletypesetter/sile:latest

# Install git (required for markdown.sile) without upgrading the system
# This preserves the ICU libraries that SILE was compiled against
RUN pacman-key --init && \
    pacman -Sy --noconfirm --disable-download-timeout archlinux-keyring && \
    pacman -S --noconfirm --disable-download-timeout --overwrite '*' git

RUN luarocks install api7-lua-tinyyaml && \
    luarocks install markdown.sile && \
    luarocks install resilient.sile

# Copy the frontmatter.sile packages into the SILE packages directory
COPY packages/frontmatter /usr/local/share/sile/packages/frontmatter
COPY packages/frontmatter-resilient /usr/local/share/sile/packages/frontmatter-resilient

# Set working directory
WORKDIR /data

# Default command runs SILE
ENTRYPOINT ["sile"]
