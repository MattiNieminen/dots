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
