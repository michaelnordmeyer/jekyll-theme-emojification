---
title: Video Content Warnings
date: 2024-01-02 13:00:00 +00:00
description: Post lists can have content warnings to hint privacy-violating video embeds.
permalink: /features/video-content-warnings
uuid: D336B548-70E2-41A8-B631-92306F05D8DE
content_warnings: [video]
icon: ⚠️
theme_color: gold
---
If this page would have an video embed, the privacy of the users would have been violated, because they couldn’t make an informed decision to visit this page or not, because the embed was not visible before visiting this link.

A `content_warnings: video` in a page’s frontmatter would display 📽️ after the link on the home page or category pages.

Currently only a case-sensitive `video` is supported.

This page’s relevant frontmatter:

```yaml
---
content_warnings: [video]
---
```

And if users don’t care about privacy, they know at least that there’s a video in the post they’re about to view.

Nonetheless [privacy-friendly YouTube embeds](https://michaelnordmeyer.com/privacy-friendly-youtube-embeds) should be used when embedding YouTube videos.
