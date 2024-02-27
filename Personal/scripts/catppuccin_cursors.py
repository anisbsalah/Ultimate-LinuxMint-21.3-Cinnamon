import os
import requests
import zipfile
import shutil
import sys

# Check if running with administrative privileges
if os.geteuid() != 0:
    print("This script requires administrative privileges. Please run it with 'sudo'.")
    sys.exit(1)

# Available variations and color schemes
variations = ["Latte", "Frappe", "Macchiato", "Mocha"]
color_schemes = ["Blue", "Dark", "Flamingo", "Green", "Lavender", "Light", "Maroon", "Mauve", "Peach", "Pink", "Red", "Rosewater", "Sapphire", "Sky", "Teal", "Yellow"]

# Set base URL, temporary directory, and destination directory
base_url = "https://github.com/catppuccin/cursors/releases/download/v0.2.0"
tmp_dir = "/tmp/catppuccin-cursors"
destination_dir = "/usr/share/icons"

# Create the temporary directory
os.makedirs(tmp_dir, exist_ok=True)

# Choose variations and color schemes
print("Available variations:")
for i, variation in enumerate(variations):
    print(f"{i + 1}. {variation}")

variation_choice = input("Enter the numbers corresponding to the desired variations (separated by commas): ")
variation_indices = [int(index) - 1 for index in variation_choice.split(",")]
variations_selected = [variations[index] for index in variation_indices]

print("Available color schemes:")
for i, color_scheme in enumerate(color_schemes):
    print(f"{i + 1}. {color_scheme}")

color_scheme_choice = input("Enter the numbers corresponding to the desired color schemes (separated by commas): ")
color_scheme_indices = [int(index) - 1 for index in color_scheme_choice.split(",")]
color_schemes_selected = [color_schemes[index] for index in color_scheme_indices]

# Download and install cursor themes
for variation in variations_selected:
    for color_scheme in color_schemes_selected:
        # Download the cursor theme archive
        url = f"{base_url}/Catppuccin-{variation}-{color_scheme}-Cursors.zip"
        response = requests.get(url)
        with open(f"{tmp_dir}/Catppuccin-{variation}-{color_scheme}-Cursors.zip", "wb") as zip_file:
            zip_file.write(response.content)

        # Extract the cursor theme directory from the archive
        with zipfile.ZipFile(f"{tmp_dir}/Catppuccin-{variation}-{color_scheme}-Cursors.zip", "r") as zip_ref:
            zip_ref.extractall(tmp_dir)

        # Copy the cursor theme directory to the destination directory
        shutil.copytree(f"{tmp_dir}/Catppuccin-{variation}-{color_scheme}-Cursors", f"{destination_dir}/Catppuccin-{variation}-{color_scheme}-Cursors")

        # Clean up the downloaded archive
        os.remove(f"{tmp_dir}/Catppuccin-{variation}-{color_scheme}-Cursors.zip")

# Print success message
print("Cursor themes downloaded and installed successfully!")