#!/usr/bin/env bash
set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing containers using 'distrobox assemble create'..."
distrobox assemble create --file "$SCRIPT_DIR/distrobox.ini"

for container in brave dev-env; do
    echo "Running post-install for container '$container'..."
    distrobox enter "$container" -- bash "$SCRIPT_DIR/$container/post-install.sh"
done
