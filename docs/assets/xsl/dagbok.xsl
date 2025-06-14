<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        
        <html lang="en" xml:lang="en">
            <head>
                <title>Aftonstjärnan</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous"/>
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous"/>
              </head>
            <body>
                <header>
                  <h1><span class="tiny-star">&#x2726;</span>AFTONSTJÄRNAN<span class="tiny-star">&#x2726;</span> </h1>
                </header>

                <nav id="sitenav">
                    <a href="index.html">Hem</a> 
                    <a href="dagbok.html">Byggdagbok</a>
                    <a href="galleri.html">Galleri</a>
                    <a href="omprojektet.html">Om Projektet</a>
                </nav>

            
                <div class="container-fluid">
                    <div class="row">

                        <!-- Meny -->
                        <div class="col-md-2" style="max-width: 150px;">
                            <div class="list-group overflow-auto" style="max-height: 80vh;">
                                <xsl:for-each select="//tei:div[@type='page']">
                                    <xsl:variable name="index" select="position() - 1"/>
                                    <xsl:variable name="facs" select="@facs"/>
                                    <a href="#" class="list-group-item list-group-item-action text-center px-1"
                                       style="border: none;" data-target="#teiCarousel" data-slide-to="{$index}">
                                        <img class="img-fluid mb-1"
                                             style="max-height: 60px; max-width: 100%; object-fit: contain;"
                                             src="{//tei:surface[@xml:id=substring-after($facs, '#')]/tei:figure/tei:graphic[1]/@url}"
                                             alt="Miniatyr för sida {$index + 1}"/>
                                        <div style="font-size: 0.85em;">Sida <xsl:value-of select="position()"/></div>
                                    </a>
                                </xsl:for-each>
                            </div>
                        </div>

                        <!-- Dagbok -->
                        <main class="col-md-10 mb-5">
                            <div id="teiCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                                <div class="carousel-inner">
                                    <xsl:for-each select="//tei:div[@type='page']">
                                        <xsl:variable name="facs" select="@facs"/>
                                        <div class="carousel-item">
                                          
                                            <div class="d-flex align-items-center justify-content-center position-relative" style="min-height: 600px;">
                                            
                                                <!-- Vänster pil -->
                                                <a class="carousel-control-prev" href="#teiCarousel" role="button" data-slide="prev"
                                                   style="position: absolute; left: 10px; z-index: 10;">
                                                    <i class="fas fa-chevron-left fa-3x" style="color: black;"></i>
                                                </a>
                                               
                                                  <!-- Bild -->
                                                <img class="img-fluid mx-auto d-block" style="max-width: 80%">
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
                                                    <i class="fas fa-chevron-right fa-3x" style="color: black;"></i>
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

                    </div> 
                </div> 

                <footer>
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div>
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="assets/img/logos/cc.svg" class="copyright_logo"/>
                                    <img src="assets/img/logos/by.svg" class="copyright_logo"/>
                                </a>
                            </div>
                            <div> Maja Andersson, Tina Nilsson och Elin Lundh 2025</div>
                        </div>
                    </div>
                </footer>

                <!-- Scripts -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        document.querySelector('.carousel-item').classList.add('active');
                    });
                </script>
            </body>
        </html>
    </xsl:template>

   <!-- TEI -->
    
   <xsl:template match="tei:teiHeader"></xsl:template>
   <xsl:template match="tei:lb"><br/></xsl:template>
   <xsl:template match="tei:head"><h2><xsl:apply-templates/></h2></xsl:template>
   <xsl:template match="tei:del"><del><xsl:apply-templates/></del></xsl:template>
   <xsl:template match="tei:add"><sup><xsl:apply-templates/></sup></xsl:template>
   <xsl:template match="tei:hi[@rend='u']"><u><xsl:apply-templates/></u></xsl:template>
   <xsl:template match="div[@rend='center']">
       <section style="text-align: center"><xsl:apply-templates/></section>
   </xsl:template>
   <xsl:template match="div[@rend='right']">
       <section style="text-align: right"><xsl:apply-templates/></section>
   </xsl:template>
   <xsl:template match="div[@rend='left']">
       <section style="text-align: left"><xsl:apply-templates/></section>
   </xsl:template>
   <xsl:template match="tei:space">
       <xsl:choose>
           <xsl:when test="@unit = 'line'">
               <div style="{concat('height: ', @quantity, 'em;')}"></div>
           </xsl:when>
           <xsl:when test="@unit = 'cm'">
               <div style="{concat('height: ', @quantity, 'cm;')}"></div>
           </xsl:when>
           <xsl:when test="@unit = 'character'">
               <span>
                   <xsl:for-each select="1 to xs:integer(@quantity)">
                       <xsl:text>&#160;</xsl:text>
                   </xsl:for-each>
               </span>
           </xsl:when>
           <xsl:otherwise>
               <span>&#160;</span>
           </xsl:otherwise>
       </xsl:choose>
   </xsl:template>
   <xsl:template match="tei:graphic">
       <span style="display: inline-block; width: 10px; height: 10px; border: 1px solid black; margin: 0 0.2em; vertical-align: middle;"></span>
   </xsl:template>

   <xsl:template match="tei:p">
  <xsl:variable name="style">
    <xsl:choose>
      <xsl:when test="@rend = 'center'">text-align: center;</xsl:when>
      <xsl:when test="@rend = 'right'">text-align: right;</xsl:when>
      <xsl:when test="@rend = 'left'">text-align: left;</xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <p>

    
    <xsl:if test="$style != ''">
      <xsl:attribute name="style">
        <xsl:value-of select="$style"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="hi[@rend='sup']">
  <sup>
    <xsl:apply-templates/>
  </sup>
</xsl:template>


   <xsl:template match="tei:table">
       <table>
         <xsl:apply-templates/>
       </table>
     </xsl:template>
     
     <xsl:template match="tei:row">
       <tr>
         <xsl:apply-templates/>
       </tr>
     </xsl:template>
     
     <xsl:template match="tei:cell">
       <td>
         <xsl:apply-templates/>
       </td>
     </xsl:template>
    

      <xsl:template match="tei:figure">
  <figure class="cell-figure">
    <xsl:apply-templates select="tei:note[@type='figdesc']"/>
  </figure>
</xsl:template>

<xsl:template match="tei:note[@type='figdesc']">
  <div class="figure-caption">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="tei:lb">
  <br/>
</xsl:template>

<xsl:template match="tei:g">
  <xsl:choose>
    <xsl:when test="@ref = '#left-arrow'">
      &#x2190; <!-- ← -->
    </xsl:when>
    <xsl:when test="@ref = '#right-arrow'">
      &#x2192; <!-- → -->
    </xsl:when>
    <xsl:otherwise>
      <span class="symbol"><xsl:value-of select="@ref"/></span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="tei:figure">
  <figure>
    <xsl:attribute name="class">
      <xsl:text>cell-figure </xsl:text>
      <xsl:value-of select="@rend"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </figure>
</xsl:template>

<xsl:template match="tei:ref">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="@target"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>

</xsl:stylesheet>