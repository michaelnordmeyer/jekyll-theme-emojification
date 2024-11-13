<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat" />
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Feed {{ site.title_separator | default: '|' }} <xsl:value-of select="/atom:feed/atom:title" /></title>
        {%- assign icon = site.feed.icon | default: site.favicon %}
        {%- if icon %}
          {%- if icon contains '.webp' %}
        <link rel="icon" type="image/webp" href="{{ icon }}" />
          {%- elsif icon contains '.png' %}
        <link rel="icon" type="image/png" href="{{ icon }}" />
          {%- elsif icon contains '.svg' %}
        <link rel="icon" type="image/svg+xml" href="{{ icon }}" />
          {%- elsif icon contains '.jpg' or icon contains '.jpeg' %}
        <link rel="icon" type="image/jpeg" href="{{ icon }}" />
          {%- elsif icon contains '.gif' %}
        <link rel="icon" type="image/gif" href="{{ icon }}" />
          {%- elsif icon contains '.ico' %}
        <link rel="icon" type="image/x-icon" href="{{ icon }}" />
          {%- endif %}
        {%- endif %}
        <xsl:text disable-output-escaping="yes">&lt;meta name="author" content="</xsl:text>
        <xsl:value-of select="/atom:feed/atom:author/atom:name" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;link rel="canonical" href="</xsl:text>
        <xsl:value-of select="/atom:feed/atom:link[2]/@href" />
        <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
        <style>
          :root { color-scheme: light dark; }
          html {
            max-width: 60rem;
            margin: 0 auto;
            padding: 1em;
            font: 1rem / 1.5 sans-serif;
          }
          h2 { margin-bottom: 0; }
          h3 { margin-top: 0; }
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
        <p><strong>This is a web feed, also called an Atom or RSS feed</strong>. With the right software, a feedreader or newsreader app, you can use this URL to automatically tell you when this website updates while the content is delivered to you automatically. It’s free and a calmer, more pleasant reading experience without popups, cookie banners, or excessive advertising.</p>
        <p>Most blogs and news sites provide their feeds for free. They contain either the full content or only a teaser, which links to the corresponding post.</p>
        <p>Newsreader apps are vailable for all operating systems and come in free or paid versions. Here are some examples:</p>
        <ul>
          <li><a href="https://netnewswire.com/">NetNewsWire for iOS, iPadOS, and macOS (free)</a></li>
          <li><a href="https://play.google.com/store/apps/details?id=com.nononsenseapps.feeder.play">Feeder for Android (free)</a></li>
          <li><a href="https://www.inoreader.com/">Inoreader for Web, iOS, and Android (free)</a></li>
          <li><a href="https://feedbin.com/">Feedbin for Web and with seperate syncing apps for iOS, iPadOS, macOS, Windows, and Android (paid)</a></li>
        </ul>
        <p>To subscribe to a feed you need the feed URL and add it to the feed reader app, which can be done by copying the feed URL (“Copy Link Address”, “Copy Link”, or similar when right-clicking or long-pressing the link). Some apps even find the feed URL automatically if you add the site’s URL to the app.</p>
        <h1>Feed Preview</h1>
        <h2><xsl:value-of select="/atom:feed/atom:title" /></h2>
        <h3><xsl:value-of select="/atom:feed/atom:subtitle" /></h3>
        <p><a><xsl:attribute name="href"><xsl:value-of select="/atom:feed/atom:link[2]/@href" /></xsl:attribute>Visit the website of this feed →</a></p>
        <h2>Posts</h2>
        <ul>
          <xsl:for-each select="/atom:feed/atom:entry">
            <li>
              <time><xsl:attribute name="datetime"><xsl:value-of select="atom:published" /></xsl:attribute><xsl:value-of select="substring(atom:published, 0, 11)" /></time>&#160;
              <a><xsl:attribute name="href"><xsl:value-of select="atom:link/@href" /></xsl:attribute><xsl:value-of select="atom:title" /></a>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
