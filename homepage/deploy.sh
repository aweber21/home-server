#!/bin/bash

# Shell Options
shopt -s extglob

# This script's directory
SCRIPT_DIRECTORY=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# The repository directory
REPOSITORY_DIRECTORY=$(cd $SCRIPT_DIRECTORY && git rev-parse --show-toplevel)

# Source - Directory to deploy from
SOURCE_DIRECTORY=$REPOSITORY_DIRECTORY/homepage

# Destination - Directory to deploy to
DESTINATION_DIRECTORY=/opt/homepage

# Deploy Docker Compose File
cp $SOURCE_DIRECTORY/docker-compose.yml $DESTINATION_DIRECTORY

# Deploy Configuration Files
mkdir -p $DESTINATION_DIRECTORY/config
cp -r $SOURCE_DIRECTORY/config/* $DESTINATION_DIRECTORY/config
