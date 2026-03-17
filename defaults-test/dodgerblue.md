---
---
A quick test of `_config.yml`’s [frontmatter defaults](https://jekyllrb.com/docs/configuration/front-matter-defaults/) to avoid repeating yourself.

This page’s frontmatter:

```yaml
---
---
```

It’s empty.

This site’s relevant config:

```yaml
- scope:
    path: defaults-test
    type: pages
  values:
    description: "A quick test to test _config.yml defaults."
    icon: 🪽
    layout: page
    sitemap: false
    theme_color: dodgerblue
```

This is very helpful for parts of a site, which each have their own color scheme, for example. Unfortunately, it works only for pages, but not for posts. If applied to posts, it is applied to all posts, regardless of category or path.
