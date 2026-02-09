# To Do

GitHub repo card template is 1280x640, but measures 80+1120+80 = 1280. For 720px add 45px each side.

## Build

```sh
cd .. && gem build jekyll-theme-emojification.gemspec && gem install --local jekyll-theme-emojification-1.0.0.gem && cd _demo
```

## Task List

- [ ] Plugin jekyll-titleize not on GitHub Pages
- [ ] Fix SEO regarding descriptions, excerpts, and abstract
- [ ] Header image in feeds
- [ ] Error pages not on GitHub Pages
- [ ] Jekyll archives cannot apply `sitemap: false` to category pages
- [ ] Move error and redirect page keys to other themes, check for static text on pages
- [ ] Check seo-tag MINIFY_REGEX \n
- [ ] CoC [INSERT CONTACT METHOD]
- [ ] Remove author from feed entries, only keep the author for the feed
- [ ] Remove `|_config\.yml` from the regular expression in the gemspec, and `ignore_theme_config: true`?
- [ ] Using defaults with category paths will create extra categories having only the slug, but not the title
- [ ] description, tagline (seo-tag), bio (mnc)
- [ ] seo.html:33 missing og:image derived from post
  {%- if seo_tag.image %}
    <meta property="og:image" content="{{ page.featured_image.path }}">
    {%- if seo_tag.image.height %}
    <meta property="og:image:height" content="{{ seo_tag.image.height }}">
    {%- endif -%}
    {%- if seo_tag.image.width %}
    <meta property="og:image:width" content="{{ seo_tag.image.width }}">
    {%- endif -%}
  {%- endif %}
- [ ] Add all theme-supported variables in _data as YAML and create documentation
- [ ] Add info about favicon and XML or use submodules
- [ ] Submit themes
  - [ ] https://github.com/stackbit/jamstackthemes
  - [ ] https://github.com/mattvh/jekyllthemes
  - [ ] https://www.builtatlightspeed.com/submit/opensource
  - [ ] https://jekyll-themes.com/submit
- [ ] use Git submodules and two _config.yml to have content for testing (--config _config.yml _demo/_config.yml)

## Performance

jekyll-last-modified-at adds 0.5 seconds to a build (from 0.86 to 1.4). It was archived on 2024-08-21.

## Distinction Collections and Data

Generally, the [distinction between collections and data](https://ben.balter.com/2015/02/20/jekyll-collections/) is that data files do not have a large markdown body, and live in a single file, rather than multiple files. Unlike collections, data files cannot render as individual files.

[Collections](http://jekyllrb.com/docs/collections/) live as separate markdown files in e.g. _docs. Then:

```html
<ul>
{%- for doc in site.docs %}
  <li><a href="{{ doc.url | absolute_url }}">{{ doc.title }}</a></li>
{%- endfor %}
</ul>
```

[Data](http://jekyllrb.com/docs/datafiles/) lives in _data as single files for each type of data, e.g. `_data/frontmatter.yml`, on which content is being iterated. Subdirectories are supported.

```yaml
foo: Explanation of foo
bar: Explanation of bar
```

or `_data/members.yml`:

```yaml
- name: Eric Mill
  github: konklone

- name: Parker Moore
  github: parkr
```

Then:

```html
<ul>
{%- for member in site.data.members %}
  <li>
    <a href="https://github.com/{{ member.github }}">
      {{ member.name }}
    </a>
  </li>
{%- endfor %}
</ul>
```

## Adding Syntax Highlighting to a Theme

Themes should support Jekyll’s syntax highlighting by sourcing a [Rouge stylesheet](https://github.com/jneen/rouge/tree/master/lib/rouge/themes), often as a Sass import. To generate a stylesheet, you can use the following command (choosing the Rouge theme that best suits your Jekyll theme):

```sh
rougify style github > _scss/rouge.scss
```
