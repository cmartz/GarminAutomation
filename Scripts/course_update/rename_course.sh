#!/bin/bash

# Usage:
# ./rename_course.sh <full csv path> <new course name>

name=`awk -F "\"*,\"*" '{ if ($1=="Data" && $4=="name") {print $5} }' "$1"`

# Rename the course and write it to a temp file
sed 's/'$name'/'$2'/' $1 > tmp.csv

# rename the temp file to the course name
mv tmp.csv $2.csv
