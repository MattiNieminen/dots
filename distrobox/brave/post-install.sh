#!/usr/bin/env bash
set -euo pipefail

echo "Running installation commands for Brave..."
sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo dnf -y install brave-browser

echo "Exporting Brave from container to host..."
distrobox-export --app brave-browser
