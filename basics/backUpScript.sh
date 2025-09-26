#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <file-to-backup>"
  exit 1
fi

file1="$1"

if [ ! -f "$file1" ]; then
  echo "Error: '$file1' not found!"
  exit 1
fi

dateMDY=$(date +%m%d%Y)

cp "$file1" "${dateMDY}_${file1}"

echo "Copied '$file1' to '${dateMDY}_${file1}'"

exit 0
