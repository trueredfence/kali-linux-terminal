#!/bin/bash
# Copy paste bleow command and logout and login again 
# bash -c "$(curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/trueredfence/kali-linux-terminal/refs/heads/main/install.sh)"
# Define the PATH environment variable
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Banner
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}          Linux Terminal Setup           ${NC}"
echo -e "${GREEN}            trueredfence                 ${NC}"
echo -e "${GREEN}         try this on your risk           ${NC}"
echo -e "${GREEN}=========================================${NC}"

# Step 1: Export PATH environment variable
export PATH

# Step 2: Navigate to /tmp/ directory
cd /tmp/

# Step 3: Detect OS and install Zsh
echo -e "${YELLOW}Installing Zsh...${NC}"

if command -v apt > /dev/null; then
    sudo apt install unzip wget curl zsh -y
elif command -v dnf > /dev/null; then
    sudo dnf install unzip wget curl zsh util-linux-user -y
elif command -v yum > /dev/null; then
    sudo yum install unzip wget curl zsh -y
elif command -v zypper > /dev/null; then
    sudo zypper installunzip wget curl zsh -y
else
    echo -e "${RED}Unsupported package manager. Install Zsh manually.${NC}"
    exit 1
fi

# Step 4: Download the repository zip file in /tmp location
echo -e "${YELLOW}Downloading repository zip file in /tmp location...${NC}"
wget https://github.com/trueredfence/kalilinuxterminal/archive/refs/heads/main.zip -O /tmp/kalilinuxterminal.zip
# Step 5: Unzip the downloaded file
echo -e "${YELLOW}Unzipping the file...${NC}"
unzip kalilinuxterminal.zip

# Step 6: Copy Zsh files to the appropriate directory
echo -e "${YELLOW}Copying Zsh files...${NC}"
cd kali-linux-terminal-main
sudo cp -Rf zsh-* /usr/share

# Step 7: Copy .zshrc to the home directory
for user in $(awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd); do    
    echo -e "${YELLOW}Copying .zshrc to home directory of user: $user ...${NC}"
    # Get the user's home directory
    user_home=$(eval echo "~$user")
    cp -Rf .zshrc "$user_home/"
done
# For root user
cp -Rf .zshrc /root/

# Step 8: Set correct permissions for Zsh files
echo -e "${YELLOW}Setting permissions...${NC}"
sudo chmod 755 /usr/share/zsh-*

# Step 9: Determine the Zsh path
ZSHELLPATH=$(command -v zsh)
echo -e "${YELLOW}Getting Z Shell Path $ZSHELLPATH...${NC}"

# Step 10: Change the default shell to Zsh

for user in $(awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd); do
    echo -e "${YELLOW}Changing the default shell to Zsh for user: $user...${NC}"  
    # Run the chsh command for each user to set their shell to Zsh
    chsh -s "$ZSHELLPATH" "$user"
done
# For root
chsh -s "$ZSHELLPATH"

# Step 11: Remove old files
echo -e "${YELLOW}Removing old files...${NC}"
rm -Rf /tmp/kalili*

# Step 12: Prompt for reboot
echo -e "${YELLOW}To check please logout and login again or reboot the system${NC}"
