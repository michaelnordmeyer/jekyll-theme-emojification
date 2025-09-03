#!/usr/bin/env bash

# User-configurable settings for non-SVG icons
font="/System/Library/Fonts/Apple Symbols.ttf"
glyph="★"

set -euo pipefail

if [[ ${#} -ne 3 ]]; then
  echo "Generates icons and HTML include of icons"
  echo "Usage: ${0##*/} <scss_path> <output_path_prefix> <image-format>"
  echo "<image-format> can be one of: jpg png webp svg"
  exit 1
fi

dirname="${0%/*}"
scss_path="${1}"
output_path_prefix="${2}"
icon_output_dir="${output_path_prefix}/assets/icons"
include_input_dir="${icon_output_dir}"
include_output_dir="${output_path_prefix}/_includes/icons"
image_format="${3,,}"
named_colors="aliceblue antiquewhite aqua aquamarine azure beige bisque black blanchedalmond blue blueviolet brown burlywood cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan darkblue darkcyan darkgoldenrod darkgray darkgreen darkgrey darkkhaki darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon darkseagreen darkslateblue darkslategray darkslategrey darkturquoise darkviolet deeppink deepskyblue dimgray dimgrey dodgerblue firebrick floralwhite forestgreen fuchsia gainsboro ghostwhite gold goldenrod gray green greenyellow grey honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen lemonchiffon lightblue lightcoral lightcyan lightgoldenrodyellow lightgray lightgreen lightgrey lightpink lightsalmon lightseagreen lightskyblue lightslategray lightslategrey lightsteelblue lightyellow lime limegreen linen magenta maroon mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen mediumturquoise mediumvioletred midnightblue mintcream mistyrose moccasin navajowhite navy oldlace olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip peachpuff peru pink plum powderblue purple rebeccapurple red rosybrown royalblue saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray slategrey snow springgreen steelblue tan teal thistle tomato turquoise violet wheat white whitesmoke yellow yellowgreen"

shopt -s nullglob
for scss in "${scss_path}"/*.scss; do
  basename="${scss##*/}"
  theme_color="${basename%.*}"

  if [[ "${theme_color}" == "none" ]]; then
    "${dirname}/generate-icon-include.sh" "${include_input_dir}" "${include_output_dir}" "${theme_color}" "${image_format}"
    continue
  fi

  if [[ ${named_colors} =~ (^|[[:space:]])${theme_color}($|[[:space:]]) ]]; then
    if [[ "${theme_color}" == "white" ]]; then
      if [[ "${image_format}" == "svg" ]]; then
        "${dirname}/generate-icon-svg.sh" "${icon_output_dir}" white black "${theme_color}.svg"
      else
        "${dirname}/generate-icon-unicode.sh" "${icon_output_dir}" white black "${font}" "${glyph}" "${image_format}"
      fi
    elif [[ "${theme_color}" == "grey" && "${image_format}" != "svg" ]]; then
      # Grey is much lighter in convert
      "${dirname}/generate-icon-unicode.sh" "${icon_output_dir}" "#808080" white "${font}" "${glyph}" "${image_format}" grey
    else
      if [[ "${image_format}" == "svg" ]]; then
        "${dirname}/generate-icon-svg.sh" "${icon_output_dir}" "${theme_color}" white "${theme_color}.svg"
      else
        "${dirname}/generate-icon-unicode.sh" "${icon_output_dir}" "${theme_color}" white "${font}" "${glyph}" "${image_format}"
      fi
    fi
  else
    # Hash symbol cannot be part of the SCSS filename, otherwise it cannot be HTTP-served
    if [[ "${image_format}" == "svg" ]]; then
      "${dirname}/generate-icon-svg.sh" "${icon_output_dir}" "#${theme_color}" white "${theme_color}.svg"
    else
      "${dirname}/generate-icon-unicode.sh" "${icon_output_dir}" "#${theme_color}" white "${font}" "${glyph}" "${image_format}" "${theme_color}"
    fi
  fi

  "${dirname}/generate-icon-include.sh" "${include_input_dir}" "${include_output_dir}" "${theme_color}" "${image_format}"
done
shopt -u nullglob
