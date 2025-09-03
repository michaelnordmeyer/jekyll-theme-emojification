#!/usr/bin/env bash

set -euo pipefail

if [[ ${#} -ne 4 ]]; then
  echo "Generates HTML include of icon"
  echo "Usage: ${0##*/} <input_dir> <output_dir> <theme-color> <image-format>"
  exit 1
fi

input_dir="${1}"
output_dir="${2}"
mkdir -p "${output_dir}"

theme_color=${3}
image_format=${4}

if [[ "${OSTYPE}" == "linux-gnu"* ]]; then
  parameters="-w0"
elif [[ "${OSTYPE}" == "darwin"* ]] \
  || [[ "${OSTYPE}" == "freebsd"* ]] \
  || [[ "${OSTYPE}" == "openbsd"* ]] \
  || [[ "${OSTYPE}" == "netbsd"* ]]; then
  parameters="-i"
else
  echo "Unsupported OS, but easy fix. Exiting..."
  exit 1
fi

if [[ "${theme_color}" == "none" ]]; then
  printf '<link rel="icon" href="data:;base64,=">' \
    > "${output_dir}/${theme_color}.svg.html"
  printf '<link rel="icon" href="data:;base64,=">' \
    > "${output_dir}/${theme_color}.html"
  exit
fi

icon="${input_dir}/${theme_color}.${image_format}"
base64_cmd="base64 ${parameters} ${icon}"

if [[ ${image_format} == "svg" ]]; then
  media_type="image/svg+xml"
  # printf "<link rel=\"icon\" type=\"${media_type}\" href=\"{{ '/assets/icons/${theme_color}.svg' | relative_url }}\">" \
  #   > "${output_dir}/${theme_color}.svg.html"
  printf "<link rel=\"icon\" type=\"${media_type}\" href=\"data:${media_type};base64,$(eval ${base64_cmd})\">" \
    > "${output_dir}/${theme_color}.svg.html"
else
  media_type=$(file -b --mime-type "${icon}")
  printf "<link rel=\"icon\" type=\"${media_type}\" href=\"{{ '/assets/icons/${theme_color}.${image_format}' | relative_url }}\">" \
    > "${output_dir}/${theme_color}.html"
  # printf "<link rel=\"icon\" type=\"${media_type}\" href=\"data:${media_type};base64,$(eval ${base64_cmd})\">" \
  #   > "${output_dir}/${theme_color}.html"
fi
