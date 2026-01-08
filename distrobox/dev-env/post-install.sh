#!/usr/bin/env bash
set -euo pipefail

#
# Common
#

PATH_FOR_BIN="$HOME/.local/bin"

#
# Visual Studio Code
#

echo "Running installation commands for Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Official installation instructions have 'dnf check-update && sudo dnf install code'.
# If there are updates, 'dnf check-update' exits with code 100 causing this
# script to stop. Therefore 'dnf check-update' is skipped.
sudo dnf -y install code

cp "$HOME/workspace/dots/.config/Code/User/settings.json" "$HOME/.config/Code/User/settings.json"

echo "Exporting Visual Studio Code from container to host..."
distrobox-export --app code

#
# Codex CLI
#

echo "Running installation commands for Codex CLI..."
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh

echo "Codex installation handled PATH changes inside user home directory."
echo "No need to export binaries."

#
# Bun
#

echo "Running installation commands for Bun..."

curl -fsSL https://bun.com/install | bash

echo "Exporting bun and bunx from container to host..."
echo "Exporting bun and bunx from container to host..."
distrobox-export --bin $(type -a -P bun) --export-path "$PATH_FOR_BIN"
distrobox-export --bin $(type -a -P bunx) --export-path "$PATH_FOR_BIN"

#
# Node.js and NPM
#

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | bash

\. "$HOME/.nvm/nvm.sh"

nvm install 24

echo "Exporting node, npm and npx from container to host..."
distrobox-export --bin $(type -a -P node) --export-path "$PATH_FOR_BIN"
distrobox-export --bin $(type -a -P npm) --export-path "$PATH_FOR_BIN"
distrobox-export --bin $(type -a -P npx) --export-path "$PATH_FOR_BIN"

#
# Bun
#

echo "Running installation commands for Bun..."

curl -fsSL https://bun.com/install | bash

echo "Exporting bun and bunx from container to host..."
echo "Exporting bun and bunx from container to host..."
distrobox-export --bin $(type -a -P bun) --export-path "$PATH_FOR_BIN"
distrobox-export --bin $(type -a -P bunx) --export-path "$PATH_FOR_BIN"

#
# Matt Pocock skills
#

npx -yes skills@latest add mattpocock/skills \
  --global \
  --agent codex \
  --skill grilling \
  --skill grill-me \
  --skill grill-with-docs \
  --skill domain-modeling \
  --yes
