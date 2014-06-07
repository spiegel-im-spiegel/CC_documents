<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:rss="http://purl.org/rss/1.0/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://web.resource.org/cc/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:wot="http://xmlns.com/wot/0.1/"
    exclude-result-prefixes="rdf rss dc">

<xsl:template match="/">
  <xsl:apply-templates select="rdf:RDF"/>
</xsl:template>

 <xsl:template match="rdf:RDF">

<!-- ここから XHTML 記述部分 -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link rel="stylesheet" type="text/css" href="css/spiegel2003.css" />
<link rel="author" href="./" />
<link rel="copyright" href="profile/policy.html#copyright" />
<link rel="contents" href="antenna/sitemap.html" />
<link rev="made" href="mailto:spiegel@alles.or.jp" />
<link rel="Top" href="./" />
<title>RSS -- <xsl:value-of select="rss:channel/rss:title"/></title>
</head>

<body style="margin:0;padding:0.5em" xml:lang="ja" lang="ja">
<div class="right" style="fontsize:smaller;">
<xsl:value-of select="rss:channel/dc:rights"/>
</div>

<h1 class="center">RSS -- <xsl:value-of select="rss:channel/rss:title"/></h1>

<xsl:apply-templates select="rss:channel" />

<hr />
<div class="right">
フィードバックは <a href="mailto:spiegel@alles.or.jp">spiegel@alles.or.jp</a> まで<br />
この文書の電子署名は <a href="{rdf:Description/wot:assurance/@rdf:resource}"><xsl:value-of select="rdf:Description/wot:assurance/@rdf:resource"/></a> です
</div>

</body>
</html>
<!-- XHTML 記述終了 -->

</xsl:template>

<xsl:template match="rss:channel">

<table style="border:solid thin gray;padding:0em;margin-left:auto;margin-right:auto;margin-top:0.1em;margin-bottom:0.1em;" summary="Channel List">
  <xsl:for-each select="*"><tr style="border:solid thin gray">
    <xsl:choose>
      <xsl:when test="local-name() = 'maker'">
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><xsl:apply-templates select="foaf:Person" /></td>
      </xsl:when>
      <xsl:when test="local-name() = 'items'">
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><xsl:apply-templates select="/rdf:RDF/rss:item" /></td>
      </xsl:when>
      <xsl:when test="local-name() = 'license'">
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a>
          <xsl:apply-templates select="/rdf:RDF/cc:License" />
        </td>
      </xsl:when>
      <xsl:when test="local-name() = 'image'">
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a>
          <xsl:apply-templates select="/rdf:RDF/rss:image" />
        </td>
      </xsl:when>
      <xsl:when test="local-name() = 'link'">
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><a href="{.}"><xsl:value-of select="." /></a></td>
      </xsl:when>
      <xsl:when test="@rdf:resource != ''">
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a></td>
      </xsl:when>
      <xsl:otherwise>
        <th class="right" style="border:solid thin gray;white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="border:solid thin gray;padding:0em 0.5em;"><xsl:value-of select="." /></td>
      </xsl:otherwise>
    </xsl:choose>
  </tr></xsl:for-each>
</table>

</xsl:template>

<xsl:template match="rss:item">

<div><a><xsl:attribute name="href"><xsl:value-of select="rss:link"/></xsl:attribute><xsl:value-of select="rss:title"/></a></div>
<table style="padding:0em;margin-left:2em;margin-right:auto;margin-top:0.5em;margin-bottom:0.5em;" summary="Item List">
  <xsl:for-each select="*"><tr>
    <xsl:choose>
      <xsl:when test="local-name() = 'link'">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{.}"><xsl:value-of select="." /></a></td>
      </xsl:when>
      <xsl:when test="@rdf:resource != ''">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a></td>
      </xsl:when>
      <xsl:otherwise>
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><xsl:value-of select="." /></td>
      </xsl:otherwise>
    </xsl:choose>
  </tr></xsl:for-each>
</table>

</xsl:template>

<xsl:template match="rss:image">

<table style="padding:0em;margin-left:2em;margin-right:auto;margin-top:0.5em;margin-bottom:0.5em;" summary="Image info">
  <xsl:for-each select="*"><tr>
    <xsl:choose>
      <xsl:when test="local-name() = 'link'">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{.}"><xsl:value-of select="." /></a></td>
      </xsl:when>
      <xsl:when test="local-name() = 'url'">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{.}"><xsl:value-of select="." /></a></td>
      </xsl:when>
      <xsl:when test="@rdf:resource != ''">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a></td>
      </xsl:when>
      <xsl:otherwise>
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><xsl:value-of select="." /></td>
      </xsl:otherwise>
    </xsl:choose>
  </tr></xsl:for-each>
</table>

</xsl:template>

<xsl:template match="cc:License">

<table style="padding:0em;margin-left:2em;margin-right:auto;margin-top:0.5em;margin-bottom:0.5em;" summary="CC Digital Code">
  <xsl:for-each select="*"><tr>
    <xsl:choose>
      <xsl:when test="@rdf:resource != ''">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a></td>
      </xsl:when>
      <xsl:otherwise>
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><xsl:value-of select="." /></td>
      </xsl:otherwise>
    </xsl:choose>
  </tr></xsl:for-each>
</table>

</xsl:template>

<xsl:template match="foaf:Person">

<table style="padding:0em;margin-left:2em;margin-right:auto;margin-top:0.5em;margin-bottom:0.5em;" summary="FoaF Info">
  <xsl:for-each select="*"><tr>
    <xsl:choose>
      <xsl:when test="@rdf:resource != ''">
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><a href="{./@rdf:resource}"><xsl:value-of select="./@rdf:resource"/></a></td>
      </xsl:when>
      <xsl:otherwise>
        <th class="right" style="white-space:nowrap;padding:0em 0.5em;vertical-align:top;"><xsl:value-of select="local-name()" /></th>
        <td style="padding:0em 0.5em;"><xsl:value-of select="." /></td>
      </xsl:otherwise>
    </xsl:choose>
  </tr></xsl:for-each>
</table>

</xsl:template>

</xsl:stylesheet>
