<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="sv" xml:lang="sv">
      <head>
        <meta charset="UTF-8"/>
        <title>Aftonstjärnan</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/main.css"/>
        <link rel="stylesheet" href="assets/css/desktop.css"/>
      </head>
      <body>
        <header>
          <h1><span class="tiny-star">&#x2726;</span>AFTONSTJÄRNAN<span class="tiny-star">&#x2726;</span></h1>
        </header>

        <nav id="sitenav">
          <a href="index.html">Hem</a> 
          <a href="dagbok.html">Dagbok ombyggnation</a> 
          <a href="galleri.html">Galleri</a>
        </nav>

        <main class="container">
          <div class="row">
            <!-- Loopa genom bilderna -->
            <xsl:for-each select="tei:galleri/tei:galleribild">
              <div class="col-md-4 mb-4">
                <div class="image-container">
                  <!-- Länk som gör bilden klickbar -->
                  <a href="{tei:link}">
                    <img class="gallery-img" 
                         src="{tei:img}" 
                         alt="{tei:label}"/>
                  </a>
                </div>
              </div>
            </xsl:for-each>
          </div>
        </main>

        <footer>
          <div class="row" id="footer">
            <div class="col-sm">
              <a href="index.html">Till startsidan</a>
            </div>
          </div>
        </footer>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
