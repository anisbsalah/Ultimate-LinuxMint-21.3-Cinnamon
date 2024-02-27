#!/bin/bash

# Available variations and color schemes
variations=("Frappe" "Macchiato" "Mocha" "Latte")
color_schemes=("Blue" "Flamingo" "Green" "Lavender" "Maroon" "Mauve" "Peach" "Pink" "Red" "Rosewater" "Sapphire" "Sky" "Teal" "Yellow")

# Choose variation
echo "Choose a variation:"
for i in "${!variations[@]}"; do
    echo "$(($i + 1)). ${variations[$i]}"
done

read -erp "Enter the number corresponding to the desired variation: " variation_choice
variation_index=$((variation_choice - 1))
variation=${variations[$variation_index]}

# Choose color schemes
echo -e "\nChoose one or more color schemes (separated by commas):"
for i in "${!color_schemes[@]}"; do
    echo "$(($i + 1)). ${color_schemes[$i]}"
done

read -erp "Enter the numbers corresponding to the desired color schemes: " color_scheme_choice
IFS=',' read -ra color_scheme_indices <<<"$color_scheme_choice"
color_schemes_selected=()
for index in "${color_scheme_indices[@]}"; do
    color_schemes_selected+=("${color_schemes[$(($index - 1))]}")
done

# Create the destination directory
destination_dir="/usr/share/themes"
mkdir -p "$destination_dir"

# Download and extract themes
base_url="https://github.com/catppuccin/gtk/releases/download/v0.7.0"
tmp_dir="/tmp/catppuccin-themes"
mkdir -p "$tmp_dir"

for color_scheme in "${color_schemes_selected[@]}"; do
    if [[ "$variation" == "Latte" ]]; then
        url="$base_url/Catppuccin-$variation-Standard-$color_scheme-Light.zip"
    else
        url="$base_url/Catppuccin-$variation-Standard-$color_scheme-Dark.zip"
    fi

    # Download the theme
    curl -OL "$url"

    # Extract the theme to the destination directory
    zipfile_path="Catppuccin-$variation-Standard-$color_scheme-$(if [[ "$variation" == "Latte" ]]; then echo "Light"; else echo "Dark"; fi).zip"
    unzip -q "$zipfile_path" -d "$tmp_dir"

    ## Move the theme directories to the destination directory
    #sudo find "$tmp_dir" -type d -name "Catppuccin-$variation-Standard-$color_scheme*" -exec mv -t "$destination_dir" {} +

    # Copy the theme directories to the destination directory
    sudo find "$tmp_dir" -type d -name "Catppuccin-$variation-Standard-$color_scheme*" -exec cp -r {} "$destination_dir" \;

    # Remove the downloaded zip file
    rm "$zipfile_path"
done

# Print success message
echo "Theme(s) downloaded and installed successfully!"
