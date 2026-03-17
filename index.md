---
list_title: Posts
last_modified_at: 2024-11-22 12:00:00 +00:00
permalink: /
layout: home
icon: 🧑‍🎨
---
A simple and minimal single-author theme with configurable big emoji as the header link, and configurable background colors, which can be chosen for each post or page. [Sample craziness](/colors/).

![Sample](/repo-card.webp){: loading="lazy" style="box-shadow: 5px 5px black;"}

## The Idea

The main idea of [Jekyll Theme Emojification](https://github.com/michaelnordmeyer/jekyll-theme-emojification) is to create a bold but minimal theme for single-author blogs, which can be configured in its appearance *for each post or page*; mainly the background color and the emoji.

It uses only a single color, the background color, and uses only white and black for the text on the page. White for headings 1 to 3, black for the rest. Links are in the same color as the black body text, but underlined in white. Visited links are underlined in black. Especially saturated colors work well with the white and black text.

And if that much color is not your thing but you like the rest, there is a black and a white variant.

## Previews

This demo has two categories each having the same style. [Features in gold](/features/) and [manuals in hotpink](/manuals/), while the rest of the site is in yellowgreen.

In the [posts from 2023 below](#2023) are a variety of color-matching emoji. Matching was done with Apple emoji, YMMW.

## Special Cases

The color grey has only a single foreground color and links colored in a two-tone style, which was derived from the appearance of Apple’s interpretation of Unicode’s [“teacup without handle”](https://emojipedia.org/teacup-without-handle#designs). Visited links are less saturated. The contrast is not great, though.

I run the grey theme on [my home page](https://michaelnordmeyer.com/).

## Limited, But Useful Features

- Clean, minimalist design
  - Single-column
  - Single-author
  - No visible authors, categories, or tags on posts or pages
  - No header, footer, or menu
  - No pagination for the home page to effectively be the archive and allow for searching all titles in-browser
- Posts
- Pages
- Fancy category pages (also on GitHub Pages, where additional plugins are not allowed)
- A styled redirection page, which will be used by the optional plugin [Jekyll Redirect From](https://github.com/jekyll/jekyll-redirect-from)
- Built-in feed and sitemap creation (no dependency to jekyll-feed and jekyll-sitemap)
- Theme-color matching favicons
- Optional [colorful index pages](/index-colorful)
- Header images
- Optional descriptions or excerpts in feed, SEO tags, and on category and home pages
- Content warnings for embedded videos
- Hidden semantic info for embedding and SEO like [Open Graph](https://ogp.me/), [JSON-LD](https://json-ld.org/), and inline [Microdata](https://en.wikipedia.org/wiki/Microdata_(HTML)). No need for the `jekyll-seo-tag` plugin
- Minimal build and load times
- Custom header and footer to add snippets

## Additional Features

Some features cannot be applied automatically due to how Jekyll integrates gem-based or remote themes. They have to be copied manually to your site’s root directory and are included in the [demo repository](https://github.com/michaelnordmeyer/jekyll-theme-emojification-demo).

- Category settings, and category and feed pages, e.g. `_data/categories.yml`, `colors/index.md`, and `colors/feed.xml`
- Custom error pages from directory `errors`
- Settings from `_config.yml`
- Draft, build, and deploy support via `Rakefile.rb`, including creating a UUID for posts

Only the categories and custom error pages need to be edited, if you want to (category name, color, emoji, title, permalink, maybe extra textual content).

## Color and Emoji Configuration

If the process of declaring all those colors and icons described in the posts below seems tedious, there’s [Jekyll’s frontmatter defaults](/defaults-test/dodgerblue) to avoid duplication.

---
