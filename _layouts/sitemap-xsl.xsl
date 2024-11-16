<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat" />
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Sitemap{{ site.title_separator | default: ' | ' }}{{ site.title | smartify }}</title>
        {%- if site.favicon %}
          {%- if site.favicon contains '.webp' %}
        <link rel="icon" type="image/webp" href="{{ site.favicon }}" />
          {%- elsif site.favicon contains '.png' %}
        <link rel="icon" type="image/png" href="{{ site.favicon }}" />
          {%- elsif site.favicon contains '.svg' %}
        <link rel="icon" type="image/svg+xml" href="{{ site.favicon }}" />
          {%- elsif site.favicon contains '.jpg' or site.favicon contains '.jpeg' %}
        <link rel="icon" type="image/jpeg" href="{{ site.favicon }}" />
          {%- elsif site.favicon contains '.gif' %}
        <link rel="icon" type="image/gif" href="{{ site.favicon }}" />
          {%- elsif site.favicon contains '.ico' %}
        <link rel="icon" type="image/x-icon" href="{{ site.favicon }}" />
          {%- endif %}
        {%- endif %}
        <meta name="author" content="{{ site.author.name }}" />
        <link rel="canonical" href="{{ '/' | absolute_url }}" />
        <style>
          :root { color-scheme: light dark; }
          html {
            max-width: 60rem;
            margin: 0 auto;
            padding: 1em;
            font: 1rem / 1.5 sans-serif;
          }
          ul { list-style-type: none; padding-left: 0; }
          li { margin: 0.5rem 0; }
          @media (prefers-color-scheme: dark) {
            html { background-color: black; color: white; }
            a { color: lightskyblue; }
            a:visited { color: plum; }
          }
        </style>
      </head>
      <body>
        <h1>Sitemap</h1>
        <p>This is the sitemap.xml (<a href="https://sitemaps.org/">what are sitemaps?</a>), which is only used by search engines.</p>
        <p><a href="{{ '/' | absolute_url }}">Visit the website of this sitemap →</a></p>
        <ul>
          <xsl:for-each select="/sitemap:urlset/sitemap:url">
            <li>
              <time><xsl:attribute name="datetime"><xsl:value-of select="sitemap:lastmod" /></xsl:attribute><xsl:value-of select="sitemap:lastmod" /></time>&#160;
              <a><xsl:attribute name="href"><xsl:value-of select="sitemap:loc" /></xsl:attribute><xsl:value-of select="sitemap:loc" /></a>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
