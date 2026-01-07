# Dots

Dotfiles and OS installation guides.

## Getting started

I am a minimalist when it comes to configuration, so there are not a lot of
dotfiles. This repository is more about "how things are installed and
configured" than "what the configuration includes".

## OS installation guides

I prefer Bazzite currently, but occasionally use these dotfiles for macOS
installations also.

### Installing Bazzite

Installation is straightforward. Download Gnome and Nvidia version of Bazzite
and use [balenaEtcher](https://etcher.balena.io/) to create bootable USB media.
It's also a good time to update BIOS.

Before installation, refer to current
[Secure Boot instructions](https://docs.bazzite.gg/General/Installation_Guide/secure_boot/).

Last time the regular boot option of the live Bazzite did not work properly,
but the "safe" or "basic" GUI that was available in boot loader menu worked
fine.

If the installer asks whether or not to create root account, keep that option
unchecked.

### Bazzite post-installation

### Start using fish

Open terminal (Ptyxis), edit default profile and command to `/usr/bin/fish`.
Prompt and dotfiles will be added later. Restart terminal.

#### Update the system

```shell
ujust update

# Optional, should not find anything to update
flatpak update
```

Remember to reboot.

#### Set refresh rate

Open settings and set maximum available refresh rate for your monitor.

#### Set audio output

Use top right controls of the top bar to set the default audio output.

#### Git

```shell
git config --global user.name "Matti Nieminen"
git config --global user.email "MattiNieminen@users.noreply.github.com"
git config --global credential.helper store
```

#### Set up workspace and clone this repo

```shell
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/MattiNieminen/dots.git
```

#### Nerd font

```shell
mkdir -p ~/.local/share/fonts/JetBrainsMono
cd ~/.local/share/fonts/JetBrainsMono
curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm -rf JetBrainsMono.zip
cd
```

#### Homebrew

Disclaimer: Homebrew on Linux is not really my thing. Nor is having multiple
package managers to choose from for every individual application. It is what
it is with Atomic distros currently...

After my last installation Homebrew was broken. This is apparently a bug that
seems to haunt Bazzite.

First test if `brew` works:

```shell
brew --version
```

All is good if version is printed! But if you get an error stating that the
command is not found, try running the following:

```shell
systemctl start brew-setup.service
```

After restarting the terminal, `brew` should work.

#### Starship

```shell
brew install starship
```

#### Bring all the terminal stuff together

Close all terminals and open a single Ptyxis.

Under 'Appearance', set theme and change font to newly installed Nerd Font. Set
font size.

Set `config.fish`:

```shell
cp ~/workspace/dots/.config/fish/config.fish ~/.config/fish/config.fish
```

Restart terminal.

#### Gnome Extensions

Open the preinstalled Gnome Extensions Manager. Disable the following
extensions:

- Add to Steam
- Blur my Shell
- Logo Menu
- Restart To

Enable the following:

- Compiz windows effect
  - :D

Finally browse available extensions and install the following

 - Hide Top Bar
   - Save your OLED!
   - Open its configuration and disable Intellihide.
 - Disable Unredirect
   - Prevents weird flickering issues with Hide Top Bar in full screen apps.

It's tempting to disable GSConnect, but that would cause problems with
Nautilus.

#### Obsidian

```shell
flatpak install md.obsidian.Obsidian
```

#### CoolerControl

```shell
ujust install-coolercontrol
```

Remember to reboot before using CoolerControl.

During the first start, CoolerControl service may require exclipit enabling.
CoolerControl will give necessary (most likely `systemctl`) commands for that.

#### Distrobox

Distrobox is included in Bazzite. I use to setup Brave and my development
environment (TODO). To setup containers:

```shell
cd ~/workspace/dots/distrobox/
distrobox assemble create
```

#### Brave

Brave is tricky. Using Flatpak would be preferred, but due to sandboxing issues
it's not recommended right now. Therefore I use a Distrobox setup for it.

So, if you followed the Distrobox section of this guide, Brave is already
installed!

The icon of exported `.desktop` file may not be visible without
logging out.

You can let Brave set itself as the default browser, but that does really work
as settings such as that only affect inside the container, not at host level.
Use Gnome settings at host to set Brave as the default Browser.

Make sure that Brave is configured to restore tabs from previous session during
startup. And remember to restore your bookmarks and make bookmarks bar visible
only on new pages.

#### Development environment

TODO Distrobox setup.
TODO copy VS Code dotfile.

#### Steam

Steam is already installed (and configured to use Proton) in Bazzite. Do the
following configurations:

- Login.
- From settings, logout all devices.
- Login again.
- From settings, disable automatic startup.
- From settings, enable and configure in-game overlay performance monitor.

#### Test suspend

I had multiple issues with suspend the last time:

- Sometimes machine suspended right after waking up.
- Sometimes machine requires two logins after suspend, with
couple of seconds in between.
- Sometime machine fails to wake from either the first or the second suspend.
There was no monitor input and fan speeds went up.

So test and monitor how suspend works after, and disable it if necessary.

#### Finishing touches

- Open Settings and go to 'Appearance'.
- Set 'Style' to 'Dark' and choose accent color.
- Set wallpaper.
- Remove unnecessary apps from Dash and add apps which are
used daily.
