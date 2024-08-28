# Kali Linux Terminal Theme

![Kali Terminal](kali-linux-terminal.png)

## Install zsh shell in your linux machine

### Donwload on machine
```bash
wget https://github.com/trueredfence/kalilinuxterminal/archive/refs/heads/main.zip -O /tmp/kalilinuxterminal.zip
unzip file.zip
```

### fedora
You can choose command as per your linux distro i am using fedora so i am using dnf if you are using ubuntu then you have to apt 

#### 1. Install z shell first
  ```bash
  sudo dnf install zsh -y
   ```
### OR
  ```bash
  sudo yum install zsh -y
   ```
#### 2. Copy zsh-autosuggestions and zsh-syntax-highlighting into /usr/share folder of your machine
   ```bash
   cd /tmp/kalilinuxterminal-main
   sudo cp -Rf zsh-* /usr/share
   ```
#### 3. copy paste .zshrc file in your ~/ [your /home/] folder if already exists replace with this file
   ```bash
   sudo cp -Rf .zshrc ~/
   ```
#### 4. chagne permisson of zsh-syantax and zsh-autosuggestion to
   ```bash
   sudo chmod 755 /usr/share/zsh-*
   ```
#### 6. change default shell to zsh
  ```
  type -a zsh ## find path to ksh ##
  chsh -s /bin/zsh ## change bash to ksh ##
  grep "^${USER}" /etc/passwd ## Verify if changed ##
  ```
#### 5. restart your machine.
