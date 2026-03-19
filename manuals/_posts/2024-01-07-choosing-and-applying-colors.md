---
title: Choosing and Applying Colors
date: 2024-01-07 21:00:00 +00:00
description: Only named colors and hex codes are supported
permalink: /manuals/choosing-and-applying-colors
uuid: 4029A474-A526-40FC-84BF-6EC064408E38
icon: 🎨
theme_color: hotpink
---
Applying different a different color is very simple. Just add `theme_color: hotpink` to the page’s frontmatter.

This page’s relevant frontmatter:

```yaml
---
theme_color: hotpink
---
```

Or the whole site can have the same color declared in the site’s `_config.yml`.

This site’s relevant config:

```yaml
theme_settings:
  theme_color: yellowgreen
```

But for this to work, the colors have to be defined beforehand. This theme has a couple defined, and they can be extended pretty easily.

This page’s `hotpink.scss`:

```scss
---
---
@use "black-white";

:root {
  color-scheme: light dark;
}

@media (prefers-color-scheme: light) {
  :root {
    --bg-color: hsl(330 100% 71%);
    --pre-bg-color: hsl(330 100% 76%);
  }
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg-color: hsl(330 100% 5%);
    --pre-bg-color: hsl(330 100% 10%);
    --fg-color: hsl(330 100% 71%);
    --decoration-color: hsl(330 100% 95%);
    --link-color: var(--fg-color);
    --link-u-color: var(--decoration-color);
    --link-vis-color: var(--fg-color);
    --link-vis-u-color: hsl(330 100% 85%);
    --line-color: var(--decoration-color);
  }

  ::selection {
    background-color: hsl(330 100% 71% / 0.5);
  }
}
```

For a style with saturated colors, only `--bg-color` and `--pre-bg-color` have to be changed for light mode.

For the `--pre-bg-color` color I mostly choose a 5 percentage points lower or higher luminance than the `--bg-color`. That’s the second percentage of this `HSL` color. [Mozilla’s color picker](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Colors/Color_picker_tool) to the rescue.

Dark mode takes a little more work, but it is derived from the light `--bg-color`. It becomes the `--fg-color` of the dark mode, and the rest of the colors are the same color but with substantially less or more luminance.

## Create Your Own

To have a defined color in frontmatter's `theme_color` or `_config.yml`’s `theme_color` be applied, a SCSS file has to exist in `assets/css`. The files in `_sass` don’t need to be changed. Both are located in the theme itself, and not the demo you are using now.

### Named Colors

For named colors like “orange”, the file has to be named `orange.scss`. Create a directory called `assets` in your site’s root directory, and finally a subdirectory called `css`. In there create a file called `orange.scss`, and put the colors derived from hsl(39 100% 50%) in there.

### Hex Colors

For hex codes like `#c34cff`, the file has to be named `c34cff.scss` without the preceding hash. That’s because Jekyll excludes file starting with a hash from its build process. And because file names can be case-sensitive, the code should always be lower-case.

But in frontmatter, the color has to be declared with the hash and in quotes, like `theme_color: "#c34cff"`, again lower-case.

Other ways of expressing HMTL colors are not supported, because the file naming and application in a page’s meta tags becomes cumbersome.

### Favicons

[Favicons should reflect the theme color](/features/theme-colored-favicons).
