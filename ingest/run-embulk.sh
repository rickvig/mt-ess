#!/bin/bash

directory="."

for file in "$directory"/ingest_*; do
    if [[ -f "$file" ]]; then
        echo "Running embulk for: $file"
        echo "embulk run "$file""
    else
        echo "No files found with prefix 'ingest_' in directory: $directory"
    fi
done
