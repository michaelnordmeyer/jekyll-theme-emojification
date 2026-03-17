---
date: 2024-01-01 12:00:00 +00:00
last_modified_at: 2024-01-01 12:00:00 +00:00
description: "Generated demo pages with different color but same content"
colorful_index: true
hide_dates: true
hide_descriptions: true
icon: 🏳️‍🌈
category: colors
layout: category
permalink: /:path/
---
If the ordinary post index is too boring, there’s also a crazy option. Put `colorful_index: true` in an index page’s frontmatter, like here, and the index entries display the full expressiveness.

This only works well for posts with backgrounds different from the index page’s background, because of the added padding. The posts with default theme color have too much of it.

Also the special theme cases black, white, and grey don’t work well with the link styling of the current page’s theme color.

## Configuration for Index Pages

Dates can be removed with `hide_dates: true` in the index page’s frontmatter.

The list emoji of the `colorful_index` can be removed with `hide_list_icon: true` in the index page’s frontmatter.

The site-wide `show_descriptions` under the key `theme_settings` can be overridden with `hide_descriptions: true` in the index page’s frontmatter to allow for custom index pages tailored to the expressiveness of the listed posts or pages.

---
