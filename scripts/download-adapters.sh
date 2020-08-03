#!/bin/bash

#
# Setup the script environment.
#

# Retrieve Docker distribution and Blacksmith version from arguments.
DOCKER_DISTRIBUTION=$1
BLACKSMITH_VERSION=$2

# Set Blacksmith environment.
BLACKSMITH_ENV="docker-${DOCKER_DISTRIBUTION}"

# Create a list of known adapters.
adapters=(
  gateway-standard
  scheduler-standard
  pubsub-kafka
  pubsub-nats
  pubsub-rabbitmq
  store-postgres
  supervisor-consul
  wanderer-postgres
)

#
# Download, extract, and then delete the archive for each adapter.
#

for adapter in ${adapters[@]}; do
  archive="${adapter}_${BLACKSMITH_ENV}.zip"

  # Download the adapter archive from the environment repository.
  wget -nv -O /.blacksmith/plugins/${BLACKSMITH_VERSION}/${archive} \
    https://github.com/nunchistudio/blacksmith-docker/releases/download/${BLACKSMITH_VERSION}/${archive}

  # Extract the archive. It shall only contains a Go plugin.
  unzip -j -d /.blacksmith/plugins/${BLACKSMITH_VERSION} /.blacksmith/plugins/${BLACKSMITH_VERSION}/${archive}

  # Remove the downloaded archive.
  rm -f /.blacksmith/plugins/${BLACKSMITH_VERSION}/${archive}

done

# If we made it here, we're done!
echo "==> Successfully downloaded Blacksmith adapters"
