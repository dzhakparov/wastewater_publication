#!/bin/bash

# the directory containing files to be unzipped
dest_dir=""

# Find all .fastq files in the raw_data directories under the destination directory
find "$dest_dir" -type f -name '*.fastq' | while read fastq_file; do
    echo "Compressing: $fastq_file"
    
    # Compress the .fastq file
    gzip "$fastq_file"
done

