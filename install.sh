#!/bin/bash

# Define the PATH environment variable
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Banner
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}          Kali Linux Terminal            ${NC}"
echo -e "${GREEN}              trueredfence               ${NC}"
echo -e "${GREEN}=========================================${NC}"

# Step 1: Export PATH environment variable
export PATH

# Step 2: Navigate to /tmp/ directory
cd /tmp/

# Step 3: Download the repository zip file
echo -e "${YELLOW}Downloading repository...${NC}"
wget https://github.com/trueredfence/kalilinuxterminal/archive/refs/heads/main.zip -O /tmp/kalilinuxterminal.zip

# Step 4: Unzip the downloaded file
echo -e "${YELLOW}Unzipping the file...${NC}"
unzip kalilinuxterminal.zip

# Step 5: Install Zsh
echo -e "${YELLOW}Installing Zsh...${NC}"
sudo dnf install zsh -y

# Step 6: Copy Zsh files to the appropriate directory
echo -e "${YELLOW}Copying Zsh files...${NC}"
cd kalilinuxterminal-main
sudo cp -Rf zsh-* /usr/share

# Step 7: Copy .zshrc to the home directory
echo -e "${YELLOW}Copying .zshrc...${NC}"
cp -Rf .zshrc ~/

# Step 8: Set correct permissions for Zsh files
echo -e "${YELLOW}Setting permissions...${NC}"
sudo chmod 755 /usr/share/zsh-*

# Step 9: Determine the Zsh path
ZSHELLPATH=$(type -p zsh)

# Step 10: Change the default shell to Zsh
echo -e "${YELLOW}Changing the default shell to Zsh...${NC}"
chsh -s $ZSHELLPATH

# Step 11: Reboot the system
echo -e "${YELLOW}Rebooting the system...${NC}"
sudo init 6
