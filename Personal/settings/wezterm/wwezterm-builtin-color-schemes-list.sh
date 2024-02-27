#!/bin/bash

WEZTERM_DATA="https://raw.githubusercontent.com/wez/wezterm/main/docs/colorschemes/data.json"
WEZTERM_COLOR_SCHEMES="${HOME}/.config/wezterm/wezterm-builtin-color-schemes.txt"

wget "${WEZTERM_DATA}" -O /tmp/wezterm-data.json
grep '"name": "' /tmp/wezterm-data.json >"${WEZTERM_COLOR_SCHEMES}"
sed -i 's/[[:space:]]*"name": "\(.*\)",/\1/g' "${WEZTERM_COLOR_SCHEMES}"
