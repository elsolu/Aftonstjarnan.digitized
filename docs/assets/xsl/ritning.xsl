<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="sv" xml:lang="sv">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          <xsl:value-of select="//tei:surface[1]/tei:figure/tei:label"/>
        </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/main.css"/>
        <link rel="stylesheet" href="assets/css/desktop.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/css/elevatezoom.min.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js"></script>

      </head>

      <body>
        <header>
          <h1>
            Aftonstjärnan
          </h1>
        </header>

        <nav id="sitenav" class="container mb-4">
            <a href="index.html">Hem</a> |
            <a href="dagbok.html">Dagbok ombyggnation</a> |
            <a href="ritningar.html">Ritningar</a> |
            <a href="galleri.html">Galleri</a>
        </nav>

        <h2>
          <xsl:value-of select="//tei:surface[1]/tei:figure/tei:label"/>
        </h2>

           <!-- BILD + ZOOM -->
        <main class="container">
          <div class="row">
            <div class="col">
              <div class="zoom-container">
                <div class="image-wrapper">
                  <img id="zoom-image"
                       src="{//tei:surface[1]/tei:figure/tei:graphic/@url}"
                       alt="{//tei:surface[1]/tei:figure/tei:label}"
                       data-zoom-image="{//tei:surface[1]/tei:figure/tei:graphic/@url}"/>
                </div>
              </div>

              <p class="description mt-3">
                <xsl:value-of select="//tei:surface[1]/tei:figure/tei:figDesc"/>
              </p>

              <!-- BESKRIVNING? -->
              <xsl:if test="//tei:div[@facs = concat('#', //tei:surface[1]/@xml:id)]">
                <h2>Beskrivning</h2>
                <div class="transcription">
                  <xsl:apply-templates select="//tei:div[@facs = concat('#', //tei:surface[1]/@xml:id)]"/>
                </div>
              </xsl:if>
            </div>
          </div>
        </main>

        <footer>
          <div class="row" id="footer">
            <div class="col-sm">
              <a href="toplayer.html">Tillbaka till galleriet</a>
            </div>
          </div>
        </footer>

        <!-- ZOOM -->
        <script type="text/javascript">
          $(document).ready(function() {
            $('#zoom-image').elevateZoom({
              zoomType: "window",
              zoomWindowWidth: 350,
              zoomWindowHeight: 350,
              zoomWindowOffset: 150,              
              zoomWindowPosition: 1,
              cursor: "crosshair",
              zoomLensFadeIn: 300,
              zoomLensFadeOut: 300
            });
          });
        </script>
      </body>
    </html>
  </xsl:template>

  <!-- TRANSKRIPTION -->
  <xsl:template match="tei:p">
    <p><xsl:value-of select="."/></p>
  </xsl:template>

</xsl:stylesheet>
