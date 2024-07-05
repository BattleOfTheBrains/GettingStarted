#!/bin/bash

set -eo pipefail

# Define a name for the Docker image
IMAGE_NAME="potato-grow"

docker stop $IMAGE_NAME
