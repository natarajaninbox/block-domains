#!/bin/bash

HOST_FILE=/etc/hosts
TMP_HOST_FILE=/tmp/etc-hosts
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

# Download the file from GitHub
curl -H "Cache-Control: no-cache" -L -o $TMP_HOST_FILE https://raw.githubusercontent.com/natarajaninbox/block-domains/main/etc-hosts

# Check if the temporary file was successfully downloaded
if [[ ! -f $TMP_HOST_FILE ]]; then
  echo "Failed to download the file."
  exit 1
fi

# Get the checksum of the current file
checksum=$(md5 -q $HOST_FILE)

# Get the checksum of the file on GitHub
github_checksum=$(md5 -q $TMP_HOST_FILE)

echo "Local checksum: $checksum"
echo "GitHub checksum: $github_checksum"

# If the checksums don't match, then update the file
if [[ "$checksum" != "$github_checksum" ]]; then
  echo "Updating local etc-hosts file"
  cp $HOST_FILE $HOST_FILE.$TIMESTAMP.bak
  mv $TMP_HOST_FILE $HOST_FILE
else
  echo "No update needed. The files are identical."
fi
