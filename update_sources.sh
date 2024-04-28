#!/bin/bash

# Path to the sources.list file
sources_list="/etc/apt/sources.list"

# Backup the original sources.list file
cp "$sources_list" "$sources_list.bak"

# Comment out existing entries
sed -i -e 's/^deb/#deb/g' "$sources_list"
sed -i -e 's/^deb-src/#deb-src/g' "$sources_list"

# Add new entries
cat << EOF >> "$sources_list"
deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse

deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner
EOF

echo "New sources added and old ones commented out successfully."
