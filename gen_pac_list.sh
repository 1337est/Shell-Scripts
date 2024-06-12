#!/bin/bash

# update/upgrade
sudo pacman -Syu

# Define the output directory
output_dir="$HOME/Desktop/Shell-Scripts/Output"

# Ensure the output directory exists, create it if it doesn't
mkdir -p "$output_dir"

# Defines output file name
output_file="$output_dir/installed_packages.txt"

# Outputs installed packages to the file
pacman -Qqe > "$output_file"

echo "List of installed packages saved in $output_file."
