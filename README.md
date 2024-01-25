# Kali Linux Terminal Theme

## Install zsh shell in your linux machine

### fedora
You can choose command as per your linux distro i am using fedora so i am using dnf if you are using ubuntu then you have to apt 

```bash
sudo dnf install zsh
 ```

1. Copy zsh-autosuggestions and zsh-syntax-highlighting into /usr/share folder of your machine
     ```bash
   sudo cp -Rf zsh-* /usr/share
   ```
3. copy paste .zshrc file in your ~/ [your /home/] folder if already exists replace with this file
   ```bash
   sudo cp -Rf .zshrc ~/
   ```
4. chagne permisson of zsh-syantax and zsh-autosuggestion to
   ```bash
   sudo chmod 755 /usr/shard/zsh-*
   ```
5. restart your machine.
