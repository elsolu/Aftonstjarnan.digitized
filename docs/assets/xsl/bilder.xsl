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
          <xsl:value-of select="//tei:titleStmt/tei:title"/>
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
            <span class="tiny-star">&#x2726;</span>AFTONSTJÄRNAN<span class="tiny-star">&#x2726;</span>
          </h1>
        </header>

        <nav id="sitenav">
          <a href="index.html">Hem</a> 
          <a href="dagbok.html">Byggdagbok</a> 
          <a href="galleri.html">Galleri</a>
          <a href="omprojektet.html">Om Projektet</a>
        </nav>

        <!-- BILD + ZOOM -->
        <main class="container">
          <div class="row">
            <div class="col">
              <div class="zoom-container">
                <div class="image-wrapper">
                  <img id="zoom-image"
                       src="{//tei:surface[1]/tei:figure/tei:graphic/@url}"
                       alt="{//tei:titleStmt/tei:title}"
                       data-zoom-image="{//tei:surface[1]/tei:figure/tei:graphic/@url}"/>
                </div>
              </div>

        
              <!-- LABEL SOM RUBRIK UNDER BILD -->
        <xsl:variable name="label" select="//tei:surface[1]/tei:figure/tei:label"/>
        <xsl:variable name="name" select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respstmt/tei:name"/>

        <div class="col-md-6 text-left">
          <h5><strong><xsl:value-of select="$label"/></strong> </h5>
          <h5><xsl:value-of select="$name"/></h5>
        </div>

              <!-- BESKRIVNINGSTEXT FRÅN TEI:DIV (text) UNDER RUBRIKEN -->
              <div class="col-md-10 text-left">
                <h5><xsl:apply-templates select="//tei:div[@facs = //tei:surface[1]/@xml:id]"/></h5>
              </div>
            </div>
          </div>
        </main>

        <footer>
          <div class="row" id="footer">
            <div class="col-sm">
              <a href="galleri.html">Tillbaka till galleriet</a>
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
              zoomWindowOffset: 250, 
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


  <xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

</xsl:stylesheet>
