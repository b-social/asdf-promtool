#!/usr/bin/env bash

# This script will install the ASDF plugins required for this project

set -euo pipefail
IFS=$'\n\t'

plugin_list=$(asdf plugin list || echo "")

# shellcheck source=/dev/null
source "$ASDF_DIR/asdf.sh"

install_plugin() {
  plugin=$1
  if ! echo "$plugin_list" | grep -q "${plugin}" >/dev/null; then
    echo "# Installing plugin" "$@"
    asdf plugin add "$@" || {
      echo "Failed to perform plugin installation: " "$@"
      exit 1
    }
  fi

  echo "# Installing ${plugin} version"
  asdf install "${plugin}" || {
    echo "Failed to perform version installation: ${plugin}"
    exit 1
  }

  # Use this plugin for the rest of the install-asdf-plugins.sh script...
  asdf shell "${plugin}" "$(asdf current "${plugin}" | awk '{print $2}')"
}

install_plugin pre-commit
install_plugin shfmt
install_plugin shellcheck
