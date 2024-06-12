#!/bin/bash
echo "#################################"
echo "   STARTING PACMAN INSALLATION   "
echo "#################################"

# Step 0: Ensure everything is updated/upgraded
sudo pacman -Syu --noconfirm

# Step 1: Define the input file name
input_file=~/Desktop/Shell-Scripts/Output/installed_packages.txt

# Step 2: Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: $input_file not found."
    exit 1
fi

# Step 3: Loop and read each line (package) from the input file and install it
while IFS= read -r package; do
    # Remove leading and trailing whitespace characters
    package=$(echo "$package" | xargs)
    # Install the package
    sudo pacman -S --noconfirm --needed "$package"
done < "$input_file"

echo "#################################"
echo "   PACMAN INSALLATION COMPLETE   "
echo "#################################"

echo "##############################"
echo "   STARTING AUR INSALLATION   "
echo "##############################"

# Step 0: Update system
sudo pacman -Syu

# Step 1: Change to Downloads directory
cd ~/Desktop || exit 1

# Step 2: Check and cd into git directory or create it
if [ -d "AUR" ]; then
    cd AUR || exit 1
else
    mkdir AUR && cd AUR || exit 1
fi

# Step 3, 4, 5: Clone, build, and install packages
packages=("ghcup-hs-bin" "google-chrome" "httpdirfs" "httpfs2-2gbplus" "kpeoplevcard-git"  "masterpdfeditor" "slack-desktop" "teams" "ttf-ms-win11-auto" "yay" "zoom")

for package in "${packages[@]}"; do
    cd ~/Desktop/AUR || exit 1  # Go back to git directory
    git clone "https://aur.archlinux.org/${package}.git" || echo "Error cloning ${package} repository"
    cd "$package" || exit 1
    makepkg -si --noconfirm --needed || echo "Error building or installing ${package}"
done

# Step 6: Update system again
sudo pacman -Syu

echo "##############################"
echo "   AUR INSALLATION COMPLETE   "
echo "##############################"

