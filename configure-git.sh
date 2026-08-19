#!/bin/bash

# Formatting
echo

# Get email for GitHub
read -p "Enter your GitHub email: " GITHUB_EMAIL
echo

# Generate new SSH key
#   NOTE: Leave the file location as the default (leave blank)
#         Only use a password if desired
ssh-keygen -t ed25519 -C $GITHUB_EMAIL
echo

echo "Add the SSH public key shown below to your GitHub account:"
echo "    $(cat ~/.ssh/id_ed25519.pub)"
echo
echo "NOTE: It's likely best to title the SSH key as the hostname since most Git operations will occur with the same account."
echo
