#!/bin/bash

# Shell Options
shopt -s extglob

# This script's directory
SCRIPT_DIRECTORY=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# The repository directory
REPOSITORY_DIRECTORY=$(cd $SCRIPT_DIRECTORY && git rev-parse --show-toplevel)

# Source - Directory to back up from
SOURCE_DIRECTORY=/

# Destination - Directory to back up to
DESTINATION_DIRECTORY=$REPOSITORY_DIRECTORY/homeassistant

# Back Up Configuration Files
mkdir -p $DESTINATION_DIRECTORY/config
cp -r $SOURCE_DIRECTORY/config/!(.*|*.db*|*.log*|secrets.yaml) $DESTINATION_DIRECTORY/config
