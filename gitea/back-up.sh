#!/bin/bash

# Shell Options
shopt -s extglob

# This script's directory
SCRIPT_DIRECTORY=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# The repository directory
REPOSITORY_DIRECTORY=$(cd $SCRIPT_DIRECTORY && git rev-parse --show-toplevel)

# Source - Directory to back up from
SOURCE_DIRECTORY=/opt/gitea

# Destination - Directory to back up to
DESTINATION_DIRECTORY=$REPOSITORY_DIRECTORY/gitea

# Back Up Docker Compose File
cp $SOURCE_DIRECTORY/docker-compose.yml $DESTINATION_DIRECTORY

# Back Up Configuration Files
mkdir -p $DESTINATION_DIRECTORY/data/gitea
cp -r $SOURCE_DIRECTORY/data/gitea/conf $DESTINATION_DIRECTORY/data/gitea
