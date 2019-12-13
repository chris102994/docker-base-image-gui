#!/bin/bash
sudo docker build --no-cache \
		  --pull \
    		  --build-arg BUILD_DATE="TODO" \
		  --build-arg VERSION="TODO" \
   		  -f Dockerfile \
		  -t "$DOCKER_REPO"/"$DOCKER_NAME"-"$DOCKER_TAG" \
		  .
