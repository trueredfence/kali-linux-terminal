# Kali Linux Terminal Theme

## Install zsh shell in your linux machine

### fedora
```bash
sudo dnf install zsh
 ```

You can choose command as per your linux distro

1. Copy zsh-autosuggestions and zsh-syntax-highlighting into /usr/share folder of your machine
2. copy paste .zshrc file in your ~/ [your /home/] folder if already exists replace with this file
   ```bash
   cp -Rf zsh-* /usr/share
   ```
4. chagne permisson of zsh-syantax and zsh-autosuggestion to
   ```bash
   sudo chmod 755 zsh-*
   ```
5. restart your machine.
