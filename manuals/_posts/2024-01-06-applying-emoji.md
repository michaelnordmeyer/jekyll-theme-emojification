---
title: Applying Emoji
date: 2024-01-06 20:00:00 +00:00
description: It’s just pasting an emoji in frontmatter.
permalink: /manuals/applying-emoji
uuid: A6B1F521-70B7-4CF1-8F94-6A56A55B9E51
icon: 🤩
theme_color: hotpink
---
An emoji has to be declared in frontmatter's `icon` or `_config.yml`’s `icon`. It’s just pasting it at the right place. That’s it.

This page’s relevant frontmatter:

```yaml
---
icon: 🤩
---
```

This site’s relevant config:

```yaml
---
theme_settings:
  icon: 🌳
---
```

If there’s no `icon` in the frontmatter and no default icon set, then there will be no icon displayed and the home link won’t be click- or tapable anymore. Only the [access key](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey) remains (h).

If icons for a limited number of pages should be hidden, [it can be done](/manuals/hiding-icons) as well.

[Emojipedia](https://emojipedia.org/) provides design views for a chosen emoji for many operating systems and software, as those look different on different platforms.
