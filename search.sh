#!/bin/bash


# File containing search strings
string_file=""

# File containing cleartext HIBP passwords
pass_file=""

# Create a directory for search results, if it does not already exist
mkdir -p "results"

# Read from $string_file, Grep for the string on each line of the file
while read -r line
do
    egrep -i "$line" "$pass_file" > "results/$line.txt"
done < $string_file

echo
echo "  Results: "

# Review results by printing the line count of each file
for file in results/*.txt
do
    wc -l $file
done
