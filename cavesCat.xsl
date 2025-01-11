<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <head>

                <title>Пещери в България</title>

                <link
                    rel="stylesheet" type="text/css" href="style.css" />
            </head>
            <script>
                function showCaves() {
                document.getElementById('cavesContainer').style.display = 'block';
                document.getElementById('regionsContainer').style.display = 'none';
                document.getElementById('toursContainer').style.display = 'none';
                };
                function showRegions() {
                document.getElementById('regionsContainer').style.display = 'block';
                document.getElementById('cavesContainer').style.display = 'none';
                document.getElementById('toursContainer').style.display = 'none';
                };
                function showTours() {
                document.getElementById('toursContainer').style.display = 'block';
                document.getElementById('cavesContainer').style.display = 'none';
                document.getElementById('regionsContainer').style.display = 'none';
                };
            </script>

            <body>
                <div class="mainContainer">
                    <h1 class="title"> Пещери в България</h1>
                    <div class="buttons">
                        <button class="button" onclick="showCaves()">
                            Пещери
                        </button>
                        <button class="button" onclick="showRegions()">
                            Региони
                        </button>
                        <button class="button" onclick="showTours()">
                            Турове
                        </button>
                    </div>
                    <xsl:apply-templates select="/cavesInBulgaria/cavesList" />
                    <xsl:apply-templates select="/cavesInBulgaria/regionsList" />
                </div>
            </body>

        </html>
    </xsl:template>

    <xsl:template match="/cavesInBulgaria/cavesList">
        <div id="cavesContainer">
            <xsl:for-each select="/cavesInBulgaria/cavesList/cave">
                <xsl:sort
                    select="characteristics/measurements/length"
                    data-type="number"
                    order="descending"
                >
                </xsl:sort>
                <div class="cave">
                    <img src="images/{id}.jpg" />
                    <div class="info">
                        <p class="caveName">
                            <xsl:value-of select="name" />
                        </p>
                        <div class="details">
                            <div class="detailsTriplet administrativeLocation">
                                <p class="bold">
                                    Област
                                </p>
                                <p>
                                    <xsl:value-of
                                        select="location/administrative/province" />
                                </p>
                                <p class="bold">
                                    Община
                                </p>
                                <p>
                                    <xsl:value-of select="location/administrative/municipality" />
                                </p>
                                <p class="bold">
                                    Населено място
                                </p>
                                <p>
                                    <xsl:value-of select="location/administrative/settlement" />
                                </p>
                            </div>

                            <div class="detailsTriplet geographicalLocation">
                                <p class="bold">
                                    Природогеографска област
                                </p>
                                <p>
                                    <xsl:value-of select="location/geographical/region" />
                                </p>
                                <p class="bold">
                                    Район
                                </p>
                                <p>
                                    <xsl:value-of select="location/geographical/area" />
                                </p>
                                <p class="bold">
                                    Местност
                                </p>
                                <p>
                                    <xsl:value-of select="location/geographical/locality" />
                                </p>
                            </div>
                            <div class="detailsTriplet characteristics">
                                <p class="bold">
                                    Морфологичен вид
                                </p>
                                <p>
                                    <xsl:value-of select="characteristics/morphologicalType" />
                                </p>
                                <p class="bold">
                                    Влажност
                                </p>
                                <p>
                                    <xsl:value-of select="characteristics/levelOfHumidity" />
                                </p>
                                <p class="bold">
                                    Дължина
                                </p>
                                <p>
                                    <xsl:value-of select="characteristics/measurements/length" />м </p>
                                <p class="bold">
                                    Денивелация
                                </p>
                                <p>
                                    <xsl:value-of select="characteristics/measurements/denivelation" />
                                    м </p>
                                <p class="bold">
                                    Надморска височина
                                </p>
                                <p>
                                    <xsl:value-of select="characteristics/measurements/altitude" />м </p>
                            </div>

                        </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
        <div id="toursContainer">
            <xsl:for-each select="/cavesInBulgaria/cavesList/cave">
                <xsl:if test="tours/tour">

                    <p class="groupLabel bold">
                        <xsl:value-of select="name" />
                    </p>


                    <xsl:for-each select="tours/tour">
                        <div class="tour">
                            <div class="info">
                                <p class="tourName"> Тур с <xsl:value-of select="guide" />
                                </p>
                                <div class="details">
                                    <div class="detailsTriplet">
                                        <p class="bold">Дата</p>
                                        <xsl:value-of select="date" />
                                        <p class="bold">Час</p>
                                        <xsl:value-of select="timeOfDay" />
                                        <p class="bold">Гид</p>
                                        <xsl:value-of select="guide" />
                                    </div>
                                    <div class="detailsTriplet">
                                        <p class="bold">Цена</p>
                                        <p class="bold">Възрастен</p>
                                        <xsl:value-of select="pricing/adultPrice" />
                                        <p class="bold">Дете</p>
                                        <xsl:value-of select="pricing/childrenPrice" />
                                        <p class="bold">Студент</p>
                                        <xsl:value-of select="pricing/studentPrice" />
                                    </div>

                                </div>
                            </div>
                        </div>


                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="/cavesInBulgaria/regionsList">
        <div id="regionsContainer">
            <xsl:for-each select="/cavesInBulgaria/regionsList/regionInfo">
                <xsl:variable name="regName">
                    <xsl:value-of select="regionName" />
                </xsl:variable>
                <xsl:variable name="regId">
                    <xsl:value-of select="reg/@regIdRef" />
                </xsl:variable>

                <xsl:if
                    test="/cavesInBulgaria/cavesList/cave[location/geographical/regionId = $regId]">
                    <div class="region">
                        <p class="groupLabel bold">
                            <xsl:value-of select="regionName" />
                        </p>

                        <div>
                            <xsl:for-each
                                select="/cavesInBulgaria/cavesList/cave[location/geographical/regionId = $regId]">
                                <div class="cave">
                                    <img src="images/{id}.jpg" />
                                    <div class="info">
                                        <p class="caveName">
                                            <xsl:value-of select="name" />
                                        </p>

                                        <div class="details">
                                            <div class="detailsTriplet">
                                                <p class="bold">
                                                    Район
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="location/geographical/area" />
                                                </p>
                                                <p class="bold">
                                                    Местност
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="location/geographical/locality" />
                                                </p>
                                                <p class="bold">
                                                    Морфологичен вид
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="characteristics/morphologicalType" />
                                                </p>
                                                <p class="bold">
                                                    Влажност
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="characteristics/levelOfHumidity" />
                                                </p>
                                            </div>
                                            <div class="detailsTriplet">
                                                <p class="bold">
                                                    Дължина
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="characteristics/measurements/length" />
                                                    м </p>
                                                <p class="bold">
                                                    Денивелация
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="characteristics/measurements/denivelation" />
                                                    м </p>
                                                <p class="bold">
                                                    Надморска височина
                                                </p>
                                                <p>
                                                    <xsl:value-of
                                                        select="characteristics/measurements/altitude" />
                                                    м </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>