FROM golang:1.16.0-buster

# Update registry and install unzip.
RUN apt-get update -y; \
  apt-get install unzip -y

# Enable Go modules and set Blacksmith environment variable.
ENV GO111MODULE=on
ENV BLACKSMITH_VERSION=0.15.0

# Set the default Blacksmith Edition if not set.
ARG BLACKSMITH_EDITION=standard

# Set the remote URL and the archive name to download.
ARG REMOTE=https://github.com/nunchistudio/blacksmith-docker/releases/download/v${BLACKSMITH_VERSION}
ARG ARCHIVE=blacksmith-${BLACKSMITH_EDITION}_v${BLACKSMITH_VERSION}_docker-buster.zip

# Download, unzip, and remove the archive.
RUN wget -nv "${REMOTE}/${ARCHIVE}"; \
  unzip -j -d /usr/local/bin ${ARCHIVE}; \
  rm ${ARCHIVE}

# Start the application using the Blacksmith CLI.
CMD ["blacksmith", "start"]
