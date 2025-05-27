<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    exclude-result-prefixes="xs tei html"
    version="2.0">

    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>Aftonstjärnan</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                      crossorigin="anonymous"/>
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1><span class="tiny-star">&#x2726;</span>AFTONSTJÄRNAN<span class="tiny-star">&#x2726;</span></h1>
                </header>

                <nav id="sitenav">
                    <a href="index.html">Hem</a> 
                    <a href="dagbok.html">Byggdagbok</a> 
                    <a href="galleri.html">Galleri</a> 
                    <a href="omprojektet.html">Om Projektet</a>
                </nav>
                    
                <main id="manuscript">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm">
                                <article id="collection">
                                    <xsl:for-each select="//tei:surface">
                                        <div class="image-block">
                                            <img class="img-full">
                                                <xsl:attribute name="src">
                                                    <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="title">
                                                    <xsl:value-of select="tei:figure/tei:label"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="alt">
                                                    <xsl:value-of select="tei:figure/tei:figDesc"/>
                                                </xsl:attribute>
                                            </img>

                                            <!-- Matcha bildens ID med beskrivningen i <text><body> -->
                                           <xsl:variable name="imgID" select="@xml:id"/>
                                            <xsl:variable name="description" select="//tei:body/tei:div[@facs = $imgID]/tei:p"/>
                                            <xsl:variable name="label" select="tei:figure/tei:label"/>
                                            <xsl:variable name="name" select="//tei:titleStmt/tei:respstmt/tei:name"/>

                                            <div class="image-description">
                                                <h5><strong><xsl:value-of select="$label"/></strong> <xsl:value-of select="$name"/></h5>
                                                <h5><xsl:value-of select="$description"/></h5>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                </article>
                            </div>

                            <div class="col-sm">
                                <article id="description">
                                    <p>
                                        <strong>Description:</strong> &#160;
                                        <xsl:apply-templates select="//tei:sourceDesc"/>
                                    </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </main>

                <footer>
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div class="copyright_logos">
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"/>
                                    <img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                                </a>
                            </div>
                            <div class="copyright_text">
                                Maja Andersson, Tina Nilsson och Elin Lundh 2025
                            </div>
                        </div>
                    </div>
                </footer>

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
                        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                        crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
                        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                        crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
