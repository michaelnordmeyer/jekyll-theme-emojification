#!/usr/bin/env sh

if [ ${#} -lt 4 ]; then
  echo "Creates a 180×180 icon from a Unicode glyph, like ★"
  echo "Sets filename to background color if not set as parameter"
  echo "Usage: $(basename ${0}) <background-color> <foreground-color> <font> <unicode-glyph> <file-extension> [filename]"
  echo "Example: $(basename ${0}) hotpink white /System/Library/Fonts/Apple\ Symbols.ttf ★ webp"
  exit 1
fi

if [ -z "${6+x}" ]; then
  filename=${1}
else
  filename=${6}
fi

# Depending on the font metrics the glyph has to be manually centered.
# Only an annotation can be positioned, so the glyph becomes the annotation,
# and the label is the "no-break space" Unicode glyph:
#   -annotate +1+12 "${4}" \
#   label:' ' \
# If the metrics don't need manual centering, this will suffice:
#   label:"${4}" \

convert \
  -background ${1} \
  -fill ${2} \
  -size 180x180 \
  -gravity center \
  -font "${3}" \
  -pointsize 256 \
  -annotate +1+12 "${4}" \
  label:' ' \
  ../assets/icons/${filename}.${5}
