#!/bin/bash

HOST_FILE=/etc/hosts
TMP_HOST_FILE=/tmp/etc-hosts
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

wget -q https://raw.githubusercontent.com/natarajaninbox/block-domains/main/etc-hosts -O $TMP_HOST_FILE || exit 1

# Get the checksum of the current file
checksum=$(md5 -q $HOST_FILE)

# Get the checksum of the file on GitHub
github_checksum=$(md5 -q $TMP_HOST_FILE)

echo $checksum
echo $github_checksum

# If the checksums don't match, then update the file
if [[ "$checksum" != "$github_checksum" ]]; then
  echo "Updating local etc-hosts file"
  cp $HOST_FILE $HOST_FILE.$TIMESTAMP.bak  
  mv $TMP_HOST_FILE $HOST_FILE
fi