FROM golang:1.15.0-alpine

# We need to install gcc (and its dependencies) in addition to unzip.
# This is needed because the Go image for Alpine deletes it after installation
# to keep the image as small as possible.
RUN apk add --no-cache \
  bash \
  musl-dev \
  gcc \
  unzip

# Enable Go modules and set Blacksmith environment variable.
ENV GO111MODULE=on
ENV BLACKSMITH_VERSION=0.11.0

# Set the default Blacksmith Edition if not set.
ARG BLACKSMITH_EDITION=standard

# Set the remote URL and the archive name to download.
ARG REMOTE=https://github.com/nunchistudio/blacksmith-docker/releases/download/v${BLACKSMITH_VERSION}
ARG ARCHIVE=blacksmith-${BLACKSMITH_EDITION}_v${BLACKSMITH_VERSION}_docker-alpine.zip

# Download, unzip, and remove the archive.
RUN wget -nv "${REMOTE}/${ARCHIVE}"; \
  unzip -j -d /usr/local/bin ${ARCHIVE}; \
  rm ${ARCHIVE}

# Start the application using the Blacksmith CLI.
CMD ["blacksmith", "start"]
