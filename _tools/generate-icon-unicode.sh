#!/usr/bin/env sh

set -eu

if [ ${#} -lt 6 ] || [ ${#} -gt 7 ]; then
  echo "Creates a 180×180 icon from a Unicode glyph, like ★"
  echo "Sets filename to background color if not set as parameter"
  echo "Usage: ${0##*/} <background-color> <foreground-color> <font> <unicode-glyph> <output_dir> <file-extension> [filename]"
  echo "Example: ${0##*/} hotpink white /System/Library/Fonts/Apple\ Symbols.ttf ★ static/assets/icons webp"
  exit 1
fi

output_dir="${5}"
mkdir -p "${output_dir}"

if [ -z "${7+x}" ]; then
  filename="${1}"
else
  filename="${7}"
fi

# Depending on the font metrics the glyph has to be manually centered.
# Only an annotation can be positioned, so the glyph becomes the annotation,
# and the label is the "no-break space" Unicode glyph:
#   -annotate +1+12 "${4}" \
#   label:' ' \
# If the metrics don't need manual centering, this will suffice:
#   label:"${4}" \

convert \
  -background "${1}" \
  -fill "${2}" \
  -size 180x180 \
  -gravity center \
  -font "${3}" \
  -pointsize 256 \
  -annotate +1+12 "${4}" \
  label:' ' \
  "${output_dir}/${filename}.${6}"

chmod go+r "${output_dir}/${filename}.${6}"
