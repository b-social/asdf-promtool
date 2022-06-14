#!/usr/bin/env bash

set -euo pipefail

__dirname="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# detect the tool name from the asdf plugin directory
get_toolname() {
  if [[ -n ${OVERRIDE_TOOLNAME:-} ]]; then
    echo "${OVERRIDE_TOOLNAME}"
    return
  fi

  basename "$(dirname "${__dirname}")"
}

TOOL_NAME=$(get_toolname)
TOOL_TEST="${TOOL_NAME} --version"
case "$TOOL_NAME" in
"promtool")
  GH_REPO="https://github.com/prometheus/prometheus"
  ARTIFACT_NAME=prometheus
  BINARY_NAME=promtool
  ;;
"amtool")
  GH_REPO="https://github.com/prometheus/alertmanager"
  ARTIFACT_NAME=alertmanager
  BINARY_NAME=amtool
  ;;
"thanos")
  GH_REPO="https://github.com/thanos-io/thanos"
  ARTIFACT_NAME=thanos
  BINARY_NAME=thanos
  ;;

*)
  echo "Unknown tool: $1"
  exit 1
  ;;
esac

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if promtool is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  case "$OSTYPE" in
  "linux-gnu"*) operating_system="linux" ;;
  "darwin"*) operating_system="darwin" ;;

  *)
    echo "Unknown os: OSTYPE"
    exit 1
    ;;
  esac

  case "$(uname -m)" in
  arm64) arch="arm64" ;;
  aarch64_be) arch="arm64" ;;
  aarch64) arch="arm64" ;;
  armv8b) arch="arm64" ;;
  armv8l) arch="arm64" ;;
  i386) arch="386" ;;
  i686) arch="386" ;;
  x86_64) arch="amd64" ;;

  *)
    echo "Unknown architecture: $(uname -m)"
    exit 1
    ;;
  esac

  url="$GH_REPO/releases/download/v${version}/${ARTIFACT_NAME}-${version}.${operating_system}-${arch}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  if ! curl "${curl_opts[@]}" -o "$filename" -C - "$url"; then
    if [[ $operating_system == "darwin" ]] && [[ $arch == "arm64" ]]; then
      echo -e "asdf-$TOOL_NAME: failing back to amd64 as Apple Silicon binary does not exist"

      # The tool doesn't (yet) have an Apple Silicon binary, fallback to amd64
      arch="amd64"
      url="$GH_REPO/releases/download/v${version}/${ARTIFACT_NAME}-${version}.${operating_system}-${arch}.tar.gz"
      curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url after fallback from arm64 to amd64"
    else
      fail "Could not download $url"
    fi
  fi
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path/bin"
    cp "$ASDF_DOWNLOAD_PATH"/${BINARY_NAME} "$install_path/bin"

    test -x "$install_path/bin/${BINARY_NAME}" || fail "Expected $install_path/bin/${BINARY_NAME} to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
