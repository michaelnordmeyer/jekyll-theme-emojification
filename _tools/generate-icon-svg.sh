#!/usr/bin/env sh

set -eu

if [ ${#} -ne 5 ]; then
  echo "Creates a 180×180 SVG icon"
  echo "Usage: ${0##*/} <background-color> <foreground-color> <path> <output_dir> <filename>"
  exit 1
fi

mkdir -p "${4}"

cat > "${4}/${5}" << END
<svg width="180px" height="180px" viewBox="0 0 180 180" xmlns="http://www.w3.org/2000/svg">
  <rect width="180" height="180" fill="${1}" />
  <path d="${3}" fill="${2}" />
</svg>
END
