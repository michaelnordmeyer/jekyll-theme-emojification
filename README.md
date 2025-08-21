![Jekyll Theme Emojification](repo-card.png)

# 🤩 Jekyll Theme Emojification 🤩

A simple and minimal single-author theme with configurable big emoji as the header link, and configurable background colors, which can be chosen for each post or page.

[Demo site with examples](https://jekyll-theme-emojification.michaelnordmeyer.com/)

The demo site has useful samples and shows how many color/emoji combinations are possible. [I run a muted version of the theme using `grey` as the main color on my own site](https://michaelnordmeyer.com/).

## Compatibility

Compatible with Jekyll >= 3.9.3 and GitHub Pages.

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
- Optional colorful index pages
- Header images
- Optional descriptions or excerpts in feed, SEO tags, and on category and home pages
- Content warnings for embedded videos
- Hidden semantic info for embedding and SEO like Open Graph, JSON-LD, and inline Microdata. No need for the `jekyll-seo-tag` plugin
- Minimal build and load times
- Custom header and footer to add snippets

## Additional Features

Some features cannot be applied automatically due to how Jekyll integrates gem-based or remote themes. They have to be copied manually to your site’s root directory and are included in the [demo repository](https://github.com/michaelnordmeyer/jekyll-theme-emojification-demo).

- Category settings, and category and feed pages, e.g. `_data/categories.yml`, `colors/index.md`, and `colors/feed.xml`
- Custom error pages from directory `error`
- Settings from `_config.yml`
- Draft, build, and deploy support via `Rakefile.rb`, including creating a UUID for posts

Only the categories and custom error pages need to be edited, if you want to (category name, color, emoji, title, permalink, maybe extra textual content).

## Minutiae

### Category Pages and Feeds

For categories to be properly working, the site needs category directories having index and feed files for each category. E.g. for the category "Features" a directory called `features` with an `index.md` and `feed.xml` with at least the following content:

```yaml
---
description: "A description for the head's meta description tag created by this theme"
category: manuals
layout: category
permalink: /:path/
sitemap: false
---
```

The name of the category has to match the corresponding category in `_data/categories.yml` and the category itself. The category is either declared by adding the key `category` to a post's front matter, but it is more convenient to have all posts of a certain category in a `_posts` subdirectory of the category, e.g. `features/_posts` for category `features`.

Used categories have to be linked manually, because there is no menu.

The category icons and displayed titles are defined in `_data/categories.yml` and have to match the category name’s slug as well.

Feeds for categories are automatically linked on the bottom of index pages and are embedded in the HTML page’s `<head>`. They have to exist next to the above mentioned `index.md` as `feed.xml`.

For this automatism to work, posts and pages can only belong to a single category, which, if it is to be declared manually, with the key `category:`. `categories:` doesn’t work.

### Header Image Support

A header image is displayed after the title on posts and pages, if `featured_image` is added to the file's frontmatter.

```yaml
---
featured_image:
  path: /images/sample-image.jpg
  alt: The description of the image
  title: The title of the image
---
```

This image is also used in `feed.xml` and SEO tags as the displayed image.

### Descriptions

The descriptions are declared in the post's frontmatter:

```yaml
description: "A helpful description."
```

They should be limited to 160 characters, because some of the places where they are used are effectively limited in length. If no descriptions are declared, then page’s `excerpt` will be used. This is either the manual declared one or Jekyll will create one automatically.

#### Enabling Descriptions on the Home Page

To display post descriptions on the home page, simply add the following to your `_config.yml`:

```yaml
theme_settings:
  show_descriptions: true
```

### Favicons

There can be several favicons for a site running this theme, because it is possible to use different background colors, and the favicon should reflect the color theme. But there is also a site-wide favicon, which should reflect the style of the home page, and is used in the Atom feed.

Icons are embedded in pixel format and as SVG in a data URL. Pixel format for Safari browsers, SVG for the rest. Because your favicons are displayed in many 3rd-party apps, websites, and other places, a SVG-only or data-URL-only version wouldn't suffice. I recommend to use webp as the pixel format as it is widely supported and has the best file size to image quality ratio.

#### Customizing Favicons

Icons should be named `<color>.<image-type-extension>` without the preceding hash of a hex color, be in either jpg, png, webp image pixel format and SVG format at 180×180 resolution, and be located in `/assets/icons/`. [Theme-matching icons can be easily generated from Unicode glyphs](https://michaelnordmeyer.com/generating-favicons-from-unicode-glyphs), if custom colors are used.

Shell scripts for creating those icons are included in the directory `_tools`. They use the star (★) by default. As mentioned in the linked article above, for other fonts or glyphs it might need some positioning to adjust for the metrics of the used font. For the SVG variant a custom representation has to be drawn. These scripts need the free `convert` from ImageMagick to create the webp icons and `base64` to create the data URL.

Icons for the default theme colors are included in webp and SVG format.

### Remove Content from Search Engines

If some posts or pages should not appear in search engines, they can be removed from the `sitemap.xml`, which helps search engines to find content. Additionally, a hidden header disallowing the indexing is added to the content, which respectable search engines follow. Add this to frontmatter to achieve this:

```yaml
---
sitemap: false
---
```

### Custom header and footer to add snippets

When put in the directory `_includes`, `custom-header.html` and `custom-footer.html` allow to put custom snippets in it.

## Installation

Installation from Gem is recommended, but using a remote theme is also possible, even though it will increase build times a little, depending on your internet connection and the size of the theme download, because it will be downloaded during each build. Gems are installed locally.

GitHub Pages gem users need to use the remote theme method.

### Installation from Gem

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-emojification", group: [:jekyll_plugins]
```

Then run `bundle` in your terminal.

```sh
bundle
```

Also add the theme to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-theme-emojification
```

Make sure that this is the only `theme:` in `_config.yml`, and that there are no other `remote-theme:`.

### Installation as Remote Theme

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-remote-theme", group: [:jekyll_plugins]
```

Then run `bundle` in your terminal.

```sh
bundle
```

Finally add the remote theme to your Jekyll site's `_config.yml`:

```yaml
remote_theme: michaelnordmeyer/jekyll-theme-emojification
```

Make sure that this is the only `remote_theme:` in `_config.yml`, and that there are no other `theme:`.
