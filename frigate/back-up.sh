#!/bin/bash

# Shell Options
shopt -s extglob

# This script's directory
SCRIPT_DIRECTORY=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# The repository directory
REPOSITORY_DIRECTORY=$(cd $SCRIPT_DIRECTORY && git rev-parse --show-toplevel)

# Source - Directory to back up from
SOURCE_DIRECTORY=/opt/frigate

# Destination - Directory to back up to
DESTINATION_DIRECTORY=$REPOSITORY_DIRECTORY/frigate

# Back Up Docker Compose File
cp $SOURCE_DIRECTORY/docker-compose.yml $DESTINATION_DIRECTORY

# Back Up Configuration Files
mkdir -p $DESTINATION_DIRECTORY/config
cp -r $SOURCE_DIRECTORY/config/* $DESTINATION_DIRECTORY/config
