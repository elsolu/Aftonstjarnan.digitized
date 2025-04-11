<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Huvudmall för hela sidan -->
  <xsl:template match="/">
    <html lang="sv" xml:lang="sv">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          <!-- Hämtar etiketten för den första ritningen -->
          <xsl:value-of select="//tei:surface[1]/tei:figure/tei:label"/>
        </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/main.css"/>
        <link rel="stylesheet" href="assets/css/desktop.css"/>

        <!-- Lägg till ElevateZoom CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/css/elevatezoom.min.css" />

        <!-- Lägg till jQuery (krävs för ElevateZoom) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js"></script>
      </head>
      <body>
        <header>
          <h1>
            <!-- Hämtar etiketten för den första ritningen -->
            <xsl:value-of select="//tei:surface[1]/tei:figure/tei:label"/>
          </h1>
        </header>

        <nav id="sitenav" class="container mb-4">
            <a href="index.html">Hem</a> |
            <a href="dagbok.html">Dagbok ombyggnation</a> |
            <a href="ritningar.html">Ritningar</a> |
            <a href="galleri.html">Galleri</a>
        </nav>

        <main class="container">
          <div class="row">
            <div class="col">
              <!-- Lägg till en div runt bilden för zoom-effekten -->
              <div class="zoom-container">
                <!-- Hämtar bildens URL för den första ritningen -->
                <img id="zoom-image" class="img-fluid"
                     src="{//tei:surface[1]/tei:figure/tei:graphic/@url}"
                     alt="{//tei:surface[1]/tei:figure/tei:label}"
                     data-zoom-image="{//tei:surface[1]/tei:figure/tei:graphic/@url}"/>
              </div>
              <p class="description">
                <!-- Hämtar beskrivningen för den första ritningen -->
                <xsl:value-of select="//tei:surface[1]/tei:figure/tei:figDesc"/>
              </p>

              <!-- Om det finns en transkription för denna ritning -->
              <xsl:if test="//tei:div[@facs = concat('#', //tei:surface[1]/@xml:id)]">
                <h2>Transkription</h2>
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

        <!-- Lägg till jQuery och ElevateZoom JS för att aktivera zoom -->
        <script type="text/javascript">
          $(document).ready(function() {
            $('#zoom-image').elevateZoom({
              zoomType: "inner",   // Typ av zoom (t.ex., "inner" eller "lens")
              cursor: "crosshair", // Visa korshår för pekaren när man hovrar över bilden
              zoomWindowFadeIn: 500, // Effekt när zoomfönstret visas
              zoomWindowFadeOut: 500 // Effekt när zoomfönstret försvinner
            });
          });
        </script>
      </body>
    </html>
  </xsl:template>

  <!-- Enkel hantering av transkription -->
  <xsl:template match="tei:p">
    <p><xsl:value-of select="."/></p>
  </xsl:template>

</xsl:stylesheet>
