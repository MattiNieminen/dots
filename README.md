# Dots

Dotfiles and instructions for setting up Ubuntu for development

## Installing Ubuntu

Download desktop version and create a USB stick with dd. When installing, choose

 * Minimal Installation
 * Download updates while installing Ubuntu
 * Install thirdy party software...
 
## Post-install
 
Do these before copying dotfiles.
 
### Update the system
 
```bash
sudo apt update
sudo apt upgrade
```
 
### Git
 
```bash
sudo apt install git
git config --global user.name "Matti Nieminen"
git config --global user.email "MattiNieminen@users.noreply.github.com"
```

## Clone this repo

```bash
mkdir ~/workspace
cd ~/workspace
git clone https://github.com/MattiNieminen/dots.git
```

### Urxvt

```bash
sudo apt install rxvt-unicode
```

### Bspwm

```bash
sudo apt install bspwm feh rofi
mkdir -p ~/.config

# Check the diff before copying
diff -u /usr/share/doc/bspwm/examples/bspwmrc ~/workspace/dots/.config/bspwm/bspwmrc
diff -u /usr/share/doc/bspwm/examples/sxhkdrc ~/workspace/dots/.config/sxhkd/sxhkdrc

# If defaults have not changed, copy. Otherwise copy the examples to this repo and modify them first.
cp -r ~/workspace/dots/.config/* ~/.config/
```

### So long Ubuntu Desktop
```bash
sudo systemctl set-default multi-user.target
echo exec bspwm >> ~/.xinitrc
chmod +x ~/.xinitrc
sudo reboot now
```
