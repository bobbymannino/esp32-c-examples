#!/bin/bash
#
# Create a new ESP32 project from the template.
# Usage: ./new.sh <project>

project_name="$1"

set -e

# Check project name entered
if [ -z "$project_name" ]
then
    echo "No project name provided"
    echo "Usage:"
    echo
    echo "./new.sh <project>"
    exit 1
fi

# Check if project already exists
if [ -d "$project_name" ]
then
    echo "Project already exists: $project_name"
    exit 1
fi

echo "Copying template to \"$project_name\""
cp -r template "$project_name"

echo "Changing \"template\" to \"$project_name\""
sed -i '' "s/Template/$project_name/g" "$project_name/README.md"
sed -i '' "s/template/$project_name/g" "$project_name/CMakeLists.txt"
sed -i '' "s/template/$project_name/g" "$project_name/main/main.c"

echo "Done"
