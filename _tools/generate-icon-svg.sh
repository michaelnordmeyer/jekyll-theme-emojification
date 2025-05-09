#!/usr/bin/env sh

if [ ${#} -ne 3 ]; then
  echo "Creates a 180×180 SVG icon of a five-point star"
  echo "Usage: ${0##*/} <background-color> <foreground-color> <filename>"
  exit 1
fi

cat > ../assets/icons/${3} << END
<svg width="180px" height="180px" viewBox="0 0 180 180" xmlns="http://www.w3.org/2000/svg">
  <rect width="180" height="180" fill="${1}" />
  <path d="M90,16,106.45798706418924,67.34752415750147,160.37818220584137,67.13274241625389,116.6295824562643,98.65247584249853,133.496108669643,149.8672575837461,90,118,46.50389133035699,149.8672575837461,63.3704175437357,98.65247584249853,19.621817794158645,67.13274241625388,73.54201293581075,67.34752415750148Z" fill="${2}" />
</svg>
END
