#!/bin/bash

###############################################################################
# Script Name : install-packages.sh
# Description : Installs commonly used developer/system packages
# Author      : Abid Ali
# Website     : https://abidali.site
# License     : MIT
# Usage       : curl -fsSL https://raw.githubusercontent.com/itsSwArchitect/bash-scripts/main/common-packages/install-packages.sh | bash
###############################################################################

set -euo pipefail

echo "Updating package index..."
sudo apt-get update -y

#-------------------------------------#
# Define common packages to install   #
#-------------------------------------#
COMMON_PACKAGES=(
  build-essential
  curl
  wget
  git
  vim
  zsh
  unzip
  htop
  tree
  net-tools
  gnupg2
  software-properties-common
  ca-certificates
)

#----------------------------------------#
# Install packages one by one with echo  #
#----------------------------------------#
echo "Installing common packages..."

for pkg in "${COMMON_PACKAGES[@]}"; do
  echo "Installing: $pkg"
  sudo apt-get install -y "$pkg" >/dev/null 2>&1 && echo "✅ Installed: $pkg" || echo "❌ Failed to install: $pkg"
done

echo "All packages processed."

