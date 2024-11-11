#!/usr/bin/env bash

set -e

if [ "${#}" -lt 2 ]; then
  echo "Generates HTML include of icon in _includes/icons/"
  echo "Usage: $(basename ${0}) <theme-color> <image-format>"
  exit 1
fi

theme_color=${1}
image_format=${2}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  parameters="-w0"
elif [[ "$OSTYPE" == "darwin"* ]] || \
     [[ "$OSTYPE" == "freebsd"* ]] || \
     [[ "$OSTYPE" == "openbsd"* ]] || \
     [[ "$OSTYPE" == "netbsd"* ]]; then
  parameters="-i"
else
  echo "Unsupported OS, but easy fix. Exiting..."
  exit 1
fi

icon="../assets/icons/${theme_color}.${image_format}"
base64_cmd="base64 ${parameters} ${icon}"

if [ ${image_format} == "svg" ]; then
  media_type="image/svg+xml"
  # printf "<link rel=\"icon\" type=\"${media_type}\" href=\"{{ '/assets/icons/${theme_color}.svg' | relative_url }}\">" \
  #   > ../_includes/icons/${theme_color}.svg.html
  printf "<link rel=\"icon\" type=\"${media_type}\" href=\"data:${media_type};base64,$(eval ${base64_cmd})\">" \
    > ../_includes/icons/${theme_color}.svg.html
else
  media_type=$(file -b --mime-type ${icon})
  printf "<link rel=\"icon\" type=\"${media_type}\" href=\"{{ '/assets/icons/${theme_color}.${image_format}' | relative_url }}\">" \
    > ../_includes/icons/${theme_color}.html
  # printf "<link rel=\"icon\" type=\"${media_type}\" href=\"data:${media_type};base64,$(eval ${base64_cmd})\">" \
  #   > ../_includes/icons/${theme_color}.html
fi
