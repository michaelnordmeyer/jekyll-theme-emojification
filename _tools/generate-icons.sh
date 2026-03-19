#!/usr/bin/env bash

set -euo pipefail

if [[ ${#} -ne 4 ]]; then
  echo "Generates icons and HTML include of icons"
  echo "Usage: ${0##*/} <output_path_prefix> <theme-color> <glyph> <font>"
  echo "Examples for a five-pointed star: ${0##*/} . white \"★\" \"/System/Library/Fonts/Apple Symbols.ttf\""
  exit 1
fi

dirname="${0%/*}"
output_path_prefix="${1}"
theme_color="${2//#/}"
icon_output_dir="${output_path_prefix}/assets/icons"
icon="${3}"
font="${4}"
named_colors="aliceblue antiquewhite aqua aquamarine azure beige bisque black blanchedalmond blue blueviolet brown burlywood cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan darkblue darkcyan darkgoldenrod darkgray darkgreen darkgrey darkkhaki darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon darkseagreen darkslateblue darkslategray darkslategrey darkturquoise darkviolet deeppink deepskyblue dimgray dimgrey dodgerblue firebrick floralwhite forestgreen fuchsia gainsboro ghostwhite gold goldenrod gray green greenyellow grey honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen lemonchiffon lightblue lightcoral lightcyan lightgoldenrodyellow lightgray lightgreen lightgrey lightpink lightsalmon lightseagreen lightskyblue lightslategray lightslategrey lightsteelblue lightyellow lime limegreen linen magenta maroon mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen mediumturquoise mediumvioletred midnightblue mintcream mistyrose moccasin navajowhite navy oldlace olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip peachpuff peru pink plum powderblue purple rebeccapurple red rosybrown royalblue saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray slategrey snow springgreen steelblue tan teal thistle tomato turquoise violet wheat white whitesmoke yellow yellowgreen"

if [[ "${theme_color}" != "none" ]]; then
  if [[ ${named_colors} =~ (^|[[:space:]])${theme_color}($|[[:space:]]) ]]; then
    if [[ "${theme_color}" == "grey" ]]; then
      # Grey is much lighter in convert
      "${dirname}/generate-icon-unicode.sh" "#808080" white "${font}" "${icon}" "${icon_output_dir}" grey
    else
      "${dirname}/generate-icon-unicode.sh" "${theme_color}" white "${font}" "${icon}" "${icon_output_dir}"
    fi
  else
    if [[ "${theme_color}" == "colorless" ]]; then
      "${dirname}/generate-icon-unicode.sh" white black "${font}" "${icon}" "${icon_output_dir}" colorless
    else
      # Hash symbol cannot be part of the CSS filename, otherwise it cannot be HTTP-served
      "${dirname}/generate-icon-unicode.sh" "#${theme_color}" white "${font}" "${icon}" "${icon_output_dir}" "${theme_color}"
    fi
  fi
fi
