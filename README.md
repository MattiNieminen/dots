# Dots

Dotfiles and instructions for setting up Ubuntu as I like it. The core idea
is to install only the necessary stuff to host, and put everything else inside
Docker.

## Installing Ubuntu

Download desktop version and create a USB stick with dd. When installing,
choose

 * Minimal Installation
 * Download updates while installing Ubuntu
 * Install thirdy party software...
 
## Post-install
 
Do these before copying dotfiles.
 
### Update the system
 
```bash
sudo apt update
sudo apt upgrade
sudo apt autoremove
# Reboot because Ubuntu
sudo reboot now
```

### Packages
```bash
sudo apt install git rxvt-unicode bspwm feh rofi
```

### Zsh

```bash
sudo apt install zsh
chsh -s $(which zsh)
```

.zshrc and pure-prompt will be installed with dotfiles.

### Git

```bash
git config --global user.name "Matti Nieminen"
git config --global user.email "MattiNieminen@users.noreply.github.com"
git config --global credential.helper store
```

### Docker

```bash
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
```

## Install dotfiles

These steps install required packages and dotfiles itself.

### Clone this repo

```bash
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/MattiNieminen/dots.git
```

### So long Ubuntu Desktop

```bash
mkdir -p ~/.config

# Check the diff before copying
diff -u /usr/share/doc/bspwm/examples/bspwmrc ~/workspace/dots/.config/bspwm/bspwmrc
diff -u /usr/share/doc/bspwm/examples/sxhkdrc ~/workspace/dots/.config/sxhkd/sxhkdrc

# If defaults have not changed, copy.
# Otherwise sync new defaults with this repo first.
cp -r ~/workspace/dots/.config/* ~/.config/
cp ~/workspace/dots/.Xresources ~
cp -r ~/workspace/dots/.zshrc ~
cp -r ~/workspace/dots/.zsh ~
cp -r ~/workspace/dots/.spacemacs ~

# Remember to change into Bspwm from GDM after reboot
sudo reboot now
```
