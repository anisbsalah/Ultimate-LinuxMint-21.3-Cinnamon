import os
import subprocess
import shutil
import zipfile
import sys

# Check if running with administrative privileges
if os.geteuid() != 0:
    print("This script requires administrative privileges. Please run it with 'sudo'.")
    sys.exit(1)

# Available variations and color schemes
variations = ['Frappe', 'Macchiato', 'Mocha', 'Latte']
color_schemes = [
    'Blue', 'Flamingo', 'Green', 'Lavender', 'Maroon', 'Mauve', 'Peach',
    'Pink', 'Red', 'Rosewater', 'Sapphire', 'Sky', 'Teal', 'Yellow'
]

# Choose variation
print("Choose a variation:")
for i, variation in enumerate(variations):
    print(f"{i + 1}. {variation}")

variation_choice = input("Enter the number corresponding to the desired variation: ")
variation_index = int(variation_choice) - 1
variation = variations[variation_index]

# Choose color schemes
print("\nChoose one or more color schemes (separated by commas):")
for i, color_scheme in enumerate(color_schemes):
    print(f"{i + 1}. {color_scheme}")

color_scheme_choice = input("Enter the numbers corresponding to the desired color schemes: ")
color_scheme_indices = [int(idx) - 1 for idx in color_scheme_choice.split(",")]
color_schemes_selected = [color_schemes[idx] for idx in color_scheme_indices]

# Create the destination directory
destination_dir = "/usr/share/themes"
os.makedirs(destination_dir, exist_ok=True)

# Download and extract themes
base_url = "https://github.com/catppuccin/gtk/releases/download/v0.7.0"
tmp_dir = "/tmp/catppuccin-themes"

for color_scheme in color_schemes_selected:
    if variation == "Latte":
        url = f"{base_url}/Catppuccin-{variation}-Standard-{color_scheme}-Light.zip"
    else:
        url = f"{base_url}/Catppuccin-{variation}-Standard-{color_scheme}-Dark.zip"

    # Download the theme
    command = ["curl", "-OL", url]
    subprocess.run(command)

    # Extract the theme to the destination directory
    zipfile_path = f"Catppuccin-{variation}-Standard-{color_scheme}-{'Light' if variation == 'Latte' else 'Dark'}.zip"
    with zipfile.ZipFile(zipfile_path, 'r') as zip_ref:
        zip_ref.extractall(destination_dir)

    # Remove the downloaded zip file
    os.remove(zipfile_path)

    # Move the theme files to the destination directory
    for root, dirs, files in os.walk(tmp_dir):
        for file in files:
            if file.startswith(f"Catppuccin-{variation}-Standard-{color_scheme}"):
                src = os.path.join(root, file)
                dst = os.path.join(destination_dir, file)
                shutil.move(src, dst)

# Print success message
print("Theme(s) downloaded and installed successfully!")