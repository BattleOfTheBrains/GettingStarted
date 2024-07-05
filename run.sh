#!/bin/bash

set -eo pipefail

# Define a name for the Docker image
IMAGE_NAME="potato-grow"

# Define a tag for the Docker image
IMAGE_TAG="0.0.1"

# Build the Docker image
echo "Building Image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG . > /dev/null 2>&1

# Run the Docker container
# -d runs the container in detached mode (in the background)
# --rm removes the container when it is stopped
# --name assigns a name to the running container
# -p maps port 5000 of the container to port 5000 on the host
docker run -d --rm --name $IMAGE_NAME -p 5000:5000 $IMAGE_NAME:$IMAGE_TAG

echo "Started $IMAGE_NAME:$IMAGE_TAG..."

echo "Waiting for startup"
sleep 5

echo "Running an example curl to check app is working"

curl 127.0.0.1:5000/status
