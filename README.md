# 🤩 Jekyll Theme Emojification 🤩

A simple and minimal single-author theme with configurable big emoji as header links, and configurable background colors, which can be chosen for each post or page.

[Demo site with examples](https://jekyll-theme-emojification.michaelnordmeyer.com/)

The demo site has useful samples and shows how many color/emoji combinations are possible.

## Compatibility

Compatible with Jekyll >= 3.9.3 and GitHub pages.

## Limited, But Useful Features

- Clean, minimalist design
  - Single-column
  - Single-author
  - No visible authors, categories, or tags on posts or pages
  - No header or footer
  - No pagination for the home page to effectively be the archive and allow for searching all titles in-browser
- Posts
- Pages
- Category pages
- Header images
- Optional excerpts in feed, SEO tags, category and home pages
- Automatic dark mode favicon
- Content warnings for embedded videos
- Hidden semantic info for embedding and SEO like Open Graph, JSON-LD, and inline Microdata. No need for the `jekyll-seo-tag` plugin

## Additional Features

Some features cannot applied automatically due to how Jekyll integrates remote themes. They have to be copied manually.

- Custom error pages
- A feed.xml containing an Atom feed with in-browser styling through a XSLT. No need for the `jekyll-feed` plugin
- A sitemap.xml, because search engines should index us properly and quickly. There’s also a companion XSLT. No need for the `jekyll-sitemap` plugin
- Minimal build and load times

## Minutiae

### Category Navigation Links

For categories to be properly linked, the site needs a `category` folder having separate markdown files for each category. E.g. for the category "Features" a file called `features.md` in the folder `category` with the following content:

```yaml
---
title: "Features"
excerpt: A description for the head's meta description tag created by this theme
permalink: /category/features
sitemap: false
layout: category
---
```

The title and permalink have to match the corresponding filename and category name.

Used categories have to be linked manually, because there is no menu.

### Header Image Support

A header image is displayed after the title on posts and pages, if `image` is added to the file's frontmatter.

```yaml
---
image: /images/sample-image.jpg
image_alt: The description of the image
image_title: The title of the image
---
```

This image is also used in `feed.xml` and SEO tags as the displayed image.

### Excerpts

The excerpts are declared in the post's frontmatter:

```yaml
excerpt: "A helpful excerpt."
```

They should be limited to 160 characters, because some of the places where they are used are effectively limited in length. If no excerpts are declared, then Jekyll will create one automatically.

#### Enabling Excerpts on the Home Page

To display post excerpts on the home page, simply add the following to your `_config.yml`:

```yaml
theme_settings:
  show_excerpts: true
```

### Favicons

`icon.webp` is the favicon for the light mode, and there's also a dark variant `icon-dark.webp` for dark mode. If you want to use them, these files have to be copied manually from the demo's repository root to your site's repository root. Otherwise just create your own and name them accordingly.

## Installation

Installation from Gem is recommended, but using a remote theme is also possible, even though it will increase build time a little, depending on your internet connection, because the theme will be downloaded during each build. Gems are installed locally.

GitHub pages gem users need to use the remote theme method.

### Installation from Gem

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-emojification"
```

It's up to you, if you want to limit the version, or always get the lasted during update.

Also add the theme to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-theme-emojification
```

Make sure that this is the only `theme:` in `_config.yml`, and that there are no other `remote-theme:`. Afterwards run `bundle install`, and `bundle update` to update it, if there's a new version.

### Installation as Remote Theme

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-remote-theme"
```

And add the theme to your Jekyll site's `_config.yml`:

```yaml
remote_theme: michaelnordmeyer/jekyll-theme-emojification
```

Make sure that this is the only `remote_theme:` in `_config.yml`, and that there are no other `theme:`.

Finally, add `jekyll-remote-theme` to your plugin section in `_config.yml` as well.

## Feed.xml and Sitemap.xml

Both are included in the theme and don't need dependencies to `jekyll-feed` and `jekyll-sitemap` plugins. For a standard Jekyll installation, they work out-of-the-box if the files, `feed.xml`, `feed.xslt.xml`, `sitemap.xml`, and `sitemap.xslt.xml`, are copied to the Jekyll directory.

The XSLT files style the XML files. If a user selects the link to the feed, a styled version of the feed will be shown in the browser with an explainer of what web feeds are. The `feed.xslt.xml` can also be a drop-in when using the `jekyll-feed` plugin.

If hosted with the Github pages plugin, those plugins are already included and will automatically be used instead, unless above files are part of the site. To overwrite this, these files have to be copied manually from the theme's repository root to the site's repository root.

Because feeds are generated once, they can only support one icon. The light variant was chosen for the feed.

### Remove Content from Search Engine

If some posts or pages should not appear in search engines, they can be removed from the `sitemap.xml`, which helps search engines to find content. Additionally, a hidden header is added to the content, to which respectable search engines adhere. Add this to frontmatter to achieve this:

```yaml
---
sitemap: false
---
```
