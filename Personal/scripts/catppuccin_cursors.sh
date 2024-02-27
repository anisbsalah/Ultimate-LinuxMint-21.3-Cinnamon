#!/bin/bash

# Available variations and color schemes
variations=("Latte" "Frappe" "Macchiato" "Mocha")
color_schemes=("Blue" "Dark" "Flamingo" "Green" "Lavender" "Light" "Maroon" "Mauve" "Peach" "Pink" "Red" "Rosewater" "Sapphire" "Sky" "Teal" "Yellow")

# Set base URL, temporary directory, and destination directory
base_url="https://github.com/catppuccin/cursors/releases/download/v0.2.0"
tmp_dir="/tmp/catppuccin-cursors"
destination_dir="/usr/share/icons"

# Create the temporary directory
mkdir -p "$tmp_dir"

# Choose variations and color schemes
echo "Available variations:"
for i in "${!variations[@]}"; do
    echo "$(($i + 1)). ${variations[$i]}"
done

read -erp "Enter the numbers corresponding to the desired variations (separated by commas): " variation_choice
IFS=',' read -ra variation_indices <<<"$variation_choice"
variations_selected=()
for index in "${variation_indices[@]}"; do
    variations_selected+=("${variations[$(($index - 1))]}")
done

echo "Available color schemes:"
for i in "${!color_schemes[@]}"; do
    echo "$(($i + 1)). ${color_schemes[$i]}"
done

read -erp "Enter the numbers corresponding to the desired color schemes (separated by commas): " color_scheme_choice
IFS=',' read -ra color_scheme_indices <<<"$color_scheme_choice"
color_schemes_selected=()
for index in "${color_scheme_indices[@]}"; do
    color_schemes_selected+=("${color_schemes[$(($index - 1))]}")
done

# Download and install cursor themes
for variation in "${variations_selected[@]}"; do
    for color_scheme in "${color_schemes_selected[@]}"; do
        # Download the cursor theme archive
        url="$base_url/Catppuccin-$variation-$color_scheme-Cursors.zip"
        curl -OL "$url"

        # Extract the cursor theme directory from the archive
        unzip "Catppuccin-$variation-$color_scheme-Cursors.zip" -d "$tmp_dir"

        # Copy the cursor theme directory to the destination directory
        sudo cp -r "$tmp_dir/Catppuccin-$variation-$color_scheme-Cursors" "$destination_dir"

        # Clean up the downloaded archive
        rm "Catppuccin-$variation-$color_scheme-Cursors.zip"
    done
done

# Print success message
echo "Cursor themes downloaded and installed successfully!"
