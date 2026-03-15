#!/usr/bin/env bash

set -euo pipefail

if [[ ${#} -lt 4 || ${#} -gt 5 ]]; then
  echo "Generates icons and HTML include of icons"
  echo "Usage: ${0##*/} <output_path_prefix> <theme-color> <image-format> <glyph-or-svg-path> [font-if-glyph]"
  echo "<image-format> can be one of: png webp svg"
  echo "Examples for a five-pointed star:"
  echo "  WEBP: ${0##*/} . white webp \"★\" \"/System/Library/Fonts/Apple Symbols.ttf\""
  echo "  SVG:  ${0##*/} . white svg \"M90,16,106.45798706418924,67.34752415750147,160.37818220584137,67.13274241625389,116.6295824562643,98.65247584249853,133.496108669643,149.8672575837461,90,118,46.50389133035699,149.8672575837461,63.3704175437357,98.65247584249853,19.621817794158645,67.13274241625388,73.54201293581075,67.34752415750148Z\""
  exit 1
fi

dirname="${0%/*}"
output_path_prefix="${1}"
theme_color="${2//#/}"
icon_output_dir="${output_path_prefix}/assets/icons"
image_format="${3,,}"
icon="${4}"
font="${5:-}"
named_colors="aliceblue antiquewhite aqua aquamarine azure beige bisque black blanchedalmond blue blueviolet brown burlywood cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan darkblue darkcyan darkgoldenrod darkgray darkgreen darkgrey darkkhaki darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon darkseagreen darkslateblue darkslategray darkslategrey darkturquoise darkviolet deeppink deepskyblue dimgray dimgrey dodgerblue firebrick floralwhite forestgreen fuchsia gainsboro ghostwhite gold goldenrod gray green greenyellow grey honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen lemonchiffon lightblue lightcoral lightcyan lightgoldenrodyellow lightgray lightgreen lightgrey lightpink lightsalmon lightseagreen lightskyblue lightslategray lightslategrey lightsteelblue lightyellow lime limegreen linen magenta maroon mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen mediumturquoise mediumvioletred midnightblue mintcream mistyrose moccasin navajowhite navy oldlace olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip peachpuff peru pink plum powderblue purple rebeccapurple red rosybrown royalblue saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray slategrey snow springgreen steelblue tan teal thistle tomato turquoise violet wheat white whitesmoke yellow yellowgreen"

if [[ "${theme_color}" != "none" ]]; then
  if [[ ${named_colors} =~ (^|[[:space:]])${theme_color}($|[[:space:]]) ]]; then
    if [[ "${theme_color}" == "white" ]]; then
      if [[ "${image_format}" == "svg" ]]; then
        "${dirname}/generate-icon-svg.sh" white black "${icon}" "${icon_output_dir}" white.svg
      else
        "${dirname}/generate-icon-unicode.sh" white black "${font}" "${icon}" "${icon_output_dir}" "${image_format}"
      fi
    elif [[ "${theme_color}" == "grey" && "${image_format}" != "svg" ]]; then
      # Grey is much lighter in convert
      "${dirname}/generate-icon-unicode.sh" "#808080" white "${font}" "${icon}" "${icon_output_dir}" "${image_format}" grey
    else
      if [[ "${image_format}" == "svg" ]]; then
        "${dirname}/generate-icon-svg.sh" "${theme_color}" white "${icon}" "${icon_output_dir}" "${theme_color}.svg"
      else
        "${dirname}/generate-icon-unicode.sh" "${theme_color}" white "${font}" "${icon}" "${icon_output_dir}" "${image_format}"
      fi
    fi
  else
    # Hash symbol cannot be part of the CSS filename, otherwise it cannot be HTTP-served
    if [[ "${image_format}" == "svg" ]]; then
      "${dirname}/generate-icon-svg.sh" "#${theme_color}" white "${icon}" "${icon_output_dir}" "${theme_color}.svg"
    else
      "${dirname}/generate-icon-unicode.sh" "#${theme_color}" white "${font}" "${icon}" "${icon_output_dir}" "${image_format}" "${theme_color}"
    fi
  fi
fi
