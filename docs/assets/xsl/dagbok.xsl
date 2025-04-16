<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text><xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>DCHM Template: Diplomatic View</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous"/>
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>

            </head>
            <body>
                <header class="container">
                    <h1>
                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                    </h1>
                </header>

                <nav id="sitenav" class="container mb-4">
                    <a href="index.html">Hem</a> |
                    <a href="dagbok.html">Dagbok ombyggnation</a> |
                    <a href="ritningar.html">Ritningar</a> |
                    <a href="galleri.html">Galleri</a>
                </nav>

                <main class="container mb-5">
                    <div id="teiCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                        <div class="carousel-inner">
                          <xsl:for-each select="//tei:div[@type='page']">
                            <xsl:variable name="facs" select="@facs"/>
                            <div class="carousel-item">
                              <div class="d-flex align-items-center justify-content-center position-relative" style="min-height: 600px;">
                                <!-- Vänster pil -->
                                <a class="carousel-control-prev" href="#teiCarousel" role="button" data-slide="prev"
                                   style="position: absolute; left: 10px; z-index: 10;">
                                  <span style="font-size: 3rem; color: black; font-weight: bold;">&lt;</span>
                                </a>
                      
                                <!-- Större Bild -->
                                <img class="img-fluid mx-auto d-block" style="max-width: 80%;">
                                  <xsl:attribute name="src">
                                    <xsl:value-of select="//tei:surface[@xml:id=substring-after($facs, '#')]/tei:figure/tei:graphic[1]/@url"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="//tei:surface[@xml:id=substring-after($facs, '#')]/tei:figure/tei:label"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="alt">
                                    <xsl:value-of select="//tei:surface[@xml:id=substring-after($facs, '#')]/tei:figure/tei:figDesc"/>
                                  </xsl:attribute>
                                </img>
                      
                                <!-- Höger pil -->
                                <a class="carousel-control-next" href="#teiCarousel" role="button" data-slide="next"
                                   style="position: absolute; right: 10px; z-index: 10;">
                                  <span style="font-size: 3rem; color: black; font-weight: bold;">&gt;</span>
                                </a>
                              </div>
                      
                              <!-- Transkription -->
                              <div class="d-flex justify-content-center mt-3 px-3">
                                <div style="max-width: 800px; text-align: left;">
                                  <article class="transcription">
                                    <xsl:apply-templates select="."/>
                                  </article>
                                </div>
                              </div>
                            </div>
                          </xsl:for-each>
                        </div>
                      </div>
                      
    
                      
   
                </main>

                <footer class="container">
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div>
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="assets/img/logos/cc.svg" class="copyright_logo"/>
                                    <img src="assets/img/logos/by.svg" class="copyright_logo"/>
                                </a>
                            </div>
                            <div>2025.</div>
                        </div>
                    </div>
                </footer>

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

                <!-- Carousel Init -->
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        document.querySelector('.carousel-item').classList.add('active');
                    });
                </script>
            </body>
        </html>
    </xsl:template>

    <!-- Undanta metadata -->
    <xsl:template match="tei:teiHeader"/>

    <!-- Enkel formatering -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>

    <xsl:template match="tei:add">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <xsl:template match="tei:hi[@rend='u']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    
    <xsl:template match="div[@rend = 'center']">
        <section style="text-align : center">
            <xsl:apply-templates/>
        </section>
    </xsl:template>



</xsl:stylesheet>
