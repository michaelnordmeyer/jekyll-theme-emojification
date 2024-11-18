#!/usr/bin/env bash

# User-configurable settings for non-SVG icons
font="/System/Library/Fonts/Apple Symbols.ttf"
glyph="★"

set -e

if [ "${#}" -lt 1 ]; then
  echo "Generates icons in assets/icons/ and HTML include of icons in _includes/icons/"
  echo "Usage: $(basename ${0}) <image-format>"
  echo "<image-format> can be one of: jpg png webp svg"
  exit 1
fi

image_format=${1,,}
named_colors="aliceblue antiquewhite aqua aquamarine azure beige bisque black blanchedalmond blue blueviolet brown burlywood cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan darkblue darkcyan darkgoldenrod darkgray darkgreen darkgrey darkkhaki darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon darkseagreen darkslateblue darkslategray darkslategrey darkturquoise darkviolet deeppink deepskyblue dimgray dimgrey dodgerblue firebrick floralwhite forestgreen fuchsia gainsboro ghostwhite gold goldenrod gray green greenyellow grey honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen lemonchiffon lightblue lightcoral lightcyan lightgoldenrodyellow lightgray lightgreen lightgrey lightpink lightsalmon lightseagreen lightskyblue lightslategray lightslategrey lightsteelblue lightyellow lime limegreen linen magenta maroon mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen mediumturquoise mediumvioletred midnightblue mintcream mistyrose moccasin navajowhite navy oldlace olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip peachpuff peru pink plum powderblue purple rebeccapurple red rosybrown royalblue saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray slategrey snow springgreen steelblue tan teal thistle tomato turquoise violet wheat white whitesmoke yellow yellowgreen"

for scss in ../assets/css/*; do
  basename=$(basename ${scss})
  theme_color=${basename%.*}

  if [ ${theme_color} == "none" ]; then
    continue
  fi

  if [[ ${named_colors} =~ (^|[[:space:]])${theme_color}($|[[:space:]]) ]]; then
    if [ ${theme_color} == "white" ]; then
      if [ ${image_format} == "svg" ]; then
        ./generate-svg-icon.sh white black ${theme_color}.svg
      else
        ./generate-unicode-icon.sh white black "${font}" ${glyph} ${image_format}
      fi
    elif [ ${theme_color} == "grey" ] && [ ${image_format} != "svg" ]; then
      # Grey is much lighter in convert
      ./generate-unicode-icon.sh \#808080 white "${font}" ${glyph} ${image_format} grey
    else
      if [ ${image_format} == "svg" ]; then
        ./generate-svg-icon.sh ${theme_color} white ${theme_color}.svg
      else
        ./generate-unicode-icon.sh ${theme_color} white "${font}" ${glyph} ${image_format}
      fi
    fi
  else
    # Hash symbol cannot be part of the scss filename, otherwise it cannot be HTTP-served
    if [ ${image_format} == "svg" ]; then
      ./generate-svg-icon.sh \#${theme_color} white ${theme_color}.svg
    else
      ./generate-unicode-icon.sh \#${theme_color} white "${font}" ${glyph} ${image_format} ${theme_color}
    fi
  fi

  ./generate-icon-include.sh ${theme_color} ${image_format}
done
