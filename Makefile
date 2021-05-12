# Set the Blacksmith version.
BLACKSMITH_VERSION := 0.16.0

#
# build is a shortcut to build all the tags of the Docker images.
#
build:

	# Building Blacksmith Standard Edition for Alpine.
	docker build --no-cache -f ./alpine/Dockerfile \
		--build-arg BLACKSMITH_EDITION=standard \
		-t nunchistudio/blacksmith-standard:$(BLACKSMITH_VERSION)-alpine \
		-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-alpine .

	# Building Blacksmith Enterprise Edition for Alpine.
	docker build --no-cache -f ./alpine/Dockerfile \
		--build-arg BLACKSMITH_EDITION=enterprise \
  	-t nunchistudio/blacksmith-enterprise:$(BLACKSMITH_VERSION)-alpine .

	# Building Blacksmith Standard Edition for Buster.
	docker build --no-cache -f ./buster/Dockerfile \
		--build-arg BLACKSMITH_EDITION=standard \
		-t nunchistudio/blacksmith-standard:$(BLACKSMITH_VERSION)-buster \
		-t nunchistudio/blacksmith-standard:$(BLACKSMITH_VERSION) \
		-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-buster \
		-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION) .

	# Building Blacksmith Enterprise Edition for Buster.
	docker build --no-cache -f ./buster/Dockerfile \
		--build-arg BLACKSMITH_EDITION=enterprise \
		-t nunchistudio/blacksmith-enterprise:$(BLACKSMITH_VERSION)-buster \
		-t nunchistudio/blacksmith-enterprise:$(BLACKSMITH_VERSION) .

#
# release is a shortcut to push all the tags of the Docker images on the Docker Hub.
#
release:

	# Pushing Alpine tags.
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-alpine
	docker push nunchistudio/blacksmith-standard:$(BLACKSMITH_VERSION)-alpine
	docker push nunchistudio/blacksmith-enterprise:$(BLACKSMITH_VERSION)-alpine

	# Pushing Buster tags.
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-buster
	docker push nunchistudio/blacksmith-standard:$(BLACKSMITH_VERSION)-buster
	docker push nunchistudio/blacksmith-standard:$(BLACKSMITH_VERSION)
	docker push nunchistudio/blacksmith-enterprise:$(BLACKSMITH_VERSION)-buster
	docker push nunchistudio/blacksmith-enterprise:$(BLACKSMITH_VERSION)
