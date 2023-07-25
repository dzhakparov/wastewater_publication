#!/bin/bash

# A script that helps to organize the samples directory to run the Vpipe
# source directory containing files 
src_dir=""
# a directory where the files should be transferred 
dest_dir=""

echo "Source directory: $src_dir"
echo "Destination directory: $dest_dir"

# Find all raw_data directories under the samples folder
find "$src_dir" -type d -name 'raw_data' | while read raw_data_dir; do
    echo "Processing raw_data directory: $raw_data_dir"

    # Extract the cityname_yyyymmdd directory and the yyyymmdd directory from the path
    date_dir=$(dirname "$raw_data_dir")
    cityname_date_dir=$(dirname "$date_dir")
    cityname_date=$(basename "$cityname_date_dir")

    echo "Cityname and date directory: $cityname_date_dir"
    echo "Date directory: $date_dir"

    # Check if the cityname_yyyymmdd directory name matches the desired format
    if [[ "$cityname_date" =~ ^([a-zA-Z]+)_([0-9]{8})$ ]]; then
        city_name="${BASH_REMATCH[1]}"
        sample_date="${BASH_REMATCH[2]}"

        echo "City name: $city_name"
        echo "Sample date: $sample_date"

        # Create the destination directory structure
        mkdir -p "$dest_dir/$cityname_date/$sample_date"

        # Copy the raw_data folder to the destination directory
        rsync -av "$raw_data_dir/" "$dest_dir/$cityname_date/$sample_date/raw_data/"
    else
        echo "Cityname and date directory name does not match the expected format: $cityname_date"
    fi
done


