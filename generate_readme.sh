#!/bin/bash

README_FILE="README.md"

# Clear existing README
echo "<center>

# ⋆˙⟡ wallpapers i like ✧˖°.
" > "$README_FILE"

# Find all image files, sort them, and generate markdown
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.svg" \) | \
sort | \
while read -r file; do
    # Remove ./ prefix and file extension for title
    filename=$(basename "$file")
    title="${filename%.*}"
    
    # Add markdown entry
    echo "## $title"
    echo "![$title]($file)"
    echo ""
done >> "$README_FILE"

echo "</center>" >> "$README_FILE"

echo "$README_FILE has been regenerated with $(find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.svg" \) | wc -l | tr -d ' ') images."
