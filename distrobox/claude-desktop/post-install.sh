#!/usr/bin/env bash
set -euo pipefail

readonly keyring=/usr/share/keyrings/claude-desktop-archive-keyring.asc
readonly repo=https://downloads.claude.ai/claude-desktop

echo "Installing Claude Desktop..."
sudo apt-get -o APT::Update::Error-Mode=any update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y curl ca-certificates
curl -fsSL "$repo/key.asc" | sudo tee "$keyring" >/dev/null
printf 'deb [signed-by=%s] %s/apt/stable stable main\n' "$keyring" "$repo" |
    sudo tee /etc/apt/sources.list.d/claude-desktop.list >/dev/null
sudo apt-get -o APT::Update::Error-Mode=any update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y claude-desktop

echo "Exporting Claude Desktop from container to host..."
desktop_file="$(dpkg-query -L claude-desktop | awk '/^\/usr\/share\/applications\/[^/]+\.desktop$/ { print; exit }')"
if [[ ! -f "$desktop_file" ]]; then
    echo "Claude Desktop launcher was not found in the installed package." >&2
    exit 1
fi
distrobox-export --app "$desktop_file"
