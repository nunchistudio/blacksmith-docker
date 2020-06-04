.PHONY: build push

# Set the Blacksmith version.
BLACKSMITH_VERSION := 0.10.2

#
# build is a shortcut to build all the tags of the Docker image.
#
build:

	# Building alpine...
	docker build -f ./Dockerfile-alpine \
  	-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-alpine .

	# Building buster...
	docker build -f ./Dockerfile-buster \
		-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-buster \
		-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION) .

	# Building stretch...
	docker build -f ./Dockerfile-stretch \
  	-t nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-stretch .

#
# push is a shortcut to push all the tags of the Docker image on the Docker Hub.
# First, it makes sure to build the images so we work with the latest version.
#
push: build

	# Pushing alpine...
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-alpine

	# Pushing buster...
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-buster
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)

	# Pushing stretch...
	docker push nunchistudio/blacksmith:$(BLACKSMITH_VERSION)-stretch
