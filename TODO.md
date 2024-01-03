# To Do

- [ ] check Jekyll version compatibility
- [ ] use git submodules and two _config.yml to have content for testing (--config _config.yml /submodule/_config.yml)
- [ ] add some static files to sitemap like jekyll-sitemap?
- [ ] description, tagline (seo-tag), bio (mnc)
- [ ] image is also used for
- [ ] microdata on blog post: missing field author (optional) https://jekyll-theme-emojification.michaelnordmeyer.com/feature/header-image with https://search.google.com/test/rich-results
- [ ] default.html:47 missing og:image derived from post

{%- if seo_tag.image %}
  <meta property="og:image" content="{{ page.image.path }}">
  {%- if seo_tag.image.height %}
  <meta property="og:image:height" content="{{ seo_tag.image.height }}">
  {%- endif -%}
  {%- if seo_tag.image.width %}
  <meta property="og:image:width" content="{{ seo_tag.image.width }}">
  {%- endif -%}
{%- endif %}
