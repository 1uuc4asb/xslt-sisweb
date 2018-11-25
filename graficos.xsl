<?xml version="1.0" encoding="UTF-8"?>

<!-- Estilo (muito arduamente) feito por Lucas Borges Pereira 2018 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="/result">

        <!-- Primeiro teste com o xsl (na base) -->

        <!--<xsl:for-each select="/result/valores/entry[ano=2000]">
            <xsl:element name="estado">
                <xsl:element name="id">
                    <xsl:value-of select="estado_ibge" />
                </xsl:element>
                <xsl:element name="qt_univ">
                    <xsl:for-each select="/result/valores/entry[estado_ibge = estado_ibge ]">
                        <xsl:element name="valor">
                            <xsl:value-of select="valor" />
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:for-each> -->

        <!-- Primeiro teste com o xsl (na base) -->



        <html xmlns:svg="http://www.w3.org/2000/svg">

        <head>
            <title>Exercicio XSLT-SVG</title>
        </head>

        <object id="AdobeSVG" CLASSID="clsid:78156a80-c6a1-4bbf-8e6a-3cd390eeb4e2">
        </object>
        <xsl:processing-instruction name="import">
            namespace="svg" implementation="#AdobeSVG"
        </xsl:processing-instruction>

        <body style="text-align: center;">
            <h1> Exibindo gráficos de universidades em estados com XSLT (Extensible Stylesheet Language Transform) </h1>
            <h2> Feito por: Lucas Borges Pereira </h2>
            <h3> <a href="http://api.pgi.gov.br/api/1/serie/2139.xml"> XML transformado </a> </h3>
            <xsl:value-of select="valores/entry[0]/estado_ibge" />


            <!-- IMPLEMENTAÇÃO ANTIGA GUARDANDO A TÍTULO DE COMPARAÇÃO -->


            <!--div style="overflow:auto; width:1000px; height:800px; display:inline-block;">-->
            <!--<svg:svg width="30000" height="30000" viewBox="0 0 2500 2500">

                    <xsl:for-each select="valores/entry">
                        <xsl:sort select="estado_ibge" />
                        <xsl:sort select="ano"/>
                        <svg:text x="{6*position()}" y="2" fill="red" font-size="2">
                            <xsl:value-of select="estado_ibge" />
                        </svg:text>
                        <svg:text x="{6*position()}" y="8" fill="red" font-size="2">
                            <xsl:value-of select="ano" />
                        </svg:text>
                        <svg:text x="{6*position()}" y="{valor + 14}" fill="red" font-size="2">
                            <xsl:value-of select="valor" />
                        </svg:text>
                        <svg:line x1="{6*position()}" y1="{valor + 14}" x2="{6* (position() + 1)}" y2="{valor + 14}" style="stroke:rgb(255,0,0);stroke-width:0.3"/>
                        
                    </xsl:for-each>
                </svg:svg>-->


            <!-- IMPLEMENTAÇÃO ANTIGA GUARDANDO A TÍTULO DE COMPARAÇÃO -->

            <xsl:for-each select="valores/entry">
                <xsl:sort select="estado_ibge" />
                <xsl:if test="ano='2000'">
                    <xsl:variable name="estado_atual" select="estado_ibge" />
                    <div>
                        <svg:svg width="1300" height="600" viewBox="0 0 100 100" style="border:solid;">

                            <!-- Legenda do gráfico -->


                            <xsl:for-each select="/result/valores/entry">
                                <xsl:sort select="ano" />
                                <xsl:if test="estado_ibge='11'">
                                    <!-- Numeros dos anos no grafico -->
                                    <svg:text x="{(ano - 1999) * 13 - 55}" y="90" font-size="3">
                                        <xsl:value-of select="ano" />
                                    </svg:text>
                                    <!-- Grade Vertical do grafico -->
                                    <svg:line x1="{(ano - 1999) * 13 - 51}" y1="14" x2="{(ano - 1999) * 13 - 51}" y2="86.5" style="stroke:rgb(224,224,224    );stroke-width:0.2" />
                                    <!-- Grade Vertical do grafico -->

                                    <!-- Numeros dos anos no grafico -->


                                    <xsl:variable name="uni_num" select="90 - (ano - 1999) * 7" />
                                    <xsl:if test="ano - 1999 &lt; 11">
                                        <!-- Numeros da qt.de universidades no grafico -->
                                        <svg:text x="-45" y="{$uni_num}" font-size="3">
                                            <xsl:value-of select="ano - 1999" />
                                        </svg:text>
                                        <!-- Numeros da qt.de universidades no grafico -->
                                        <!-- Grade Vertical do grafico -->
                                        <svg:line x1="-40" y1="{$uni_num}" x2="152" y2="{$uni_num}" style="stroke:rgb(224,224,224    );stroke-width:0.2" />
                                        <!-- Grade Vertical do grafico -->
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>


                            <svg:text x="45" y="95" font-size="4"> Ano </svg:text>
                            <svg:text x="-20" y="-20" font-size="4" transform="rotate(270 20,50)"> Quantidade de Universidades (unidade) </svg:text>

                            <svg:text x="-50" y="5" font-size="3">
                                Quantidade de Universidades Federais existentes do ano 2000 ao ano 2014 no
                                <xsl:choose>
                                    <xsl:when test="estado_ibge=11">
                                        estado de Rondônia
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=12">
                                        estado do Acre
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=13">
                                        estado do Amazonas
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=14">
                                        estado de Roraima
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=15">
                                        estado do Pará
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=16">
                                        estado do Amapá
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=17">
                                        estado de Tocantins
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=21">
                                        estado do Maranhão
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=22">
                                        estado do Piauí
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=23">
                                        estado do Ceará
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=24">
                                        estado do Rio Grande do Norte
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=25">
                                        estado da Paraíba
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=26">
                                        estado de Pernambuco
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=27">
                                        estado de Alagoas
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=28">
                                        estado de Sergipe
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=29">
                                        estado da Bahia
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=31">
                                        estado de Minas Gerais
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=32">
                                        estado do Espírito Santo
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=33">
                                        estado do Rio de Janeiro
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=35">
                                        estado de São Paulo
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=41">
                                        estado do Paraná
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=42">
                                        estado de Santa Catarina
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=43">
                                        estado do Rio Grande do Sul
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=50">
                                        estado do Mato Grosso do Sul
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=51">
                                        estado do Mato Grosso
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=52">
                                        estado de Goiás
                                    </xsl:when>
                                    <xsl:when test="estado_ibge=53">
                                        Distrito Federal
                                    </xsl:when>
                                </xsl:choose>
                            </svg:text>

                            <svg:text x="30" y="98" font-size="2">
                                Fonte: http://dados.gov.br/dataset/ensino-superior/resource/35b030d8-a990-40a2-af3e-6b34413e4110?inner_span=True
                            </svg:text>
                            <!-- Legenda do gráfico -->

                            <!-- Bordas do gráfico -->

                            <svg:line x1="-40" y1="14" x2="152" y2="14" style="stroke:rgb(0,0,0);stroke-width:0.5" />
                            <svg:line x1="-40" y1="86.5" x2="152" y2="86.5" style="stroke:rgb(0,0,0);stroke-width:0.5" />
                            <svg:line x1="-40" y1="14" x2="-40" y2="86.5" style="stroke:rgb(0,0,0);stroke-width:0.5" />
                            <svg:line x1="152" y1="14" x2="152" y2="86.5" style="stroke:rgb(0,0,0);stroke-width:0.5" />

                            <!-- Bordas do gráfico -->

                            <!-- Linhas do gráfico -->
                            <xsl:for-each select="/result/valores/entry">
                                <xsl:if test="estado_ibge = $estado_atual">
                                    <xsl:if test="ano != 2014">
                                        <xsl:variable name="estadoatual_ano" select="ano" />
                                        <xsl:variable name="x1" select="(ano - 1999) * 13 - 51" />
                                        <xsl:variable name="y1" select="89.5 - valor * 7" />
                                        <xsl:variable name="x2" select="(ano + 1 - 1999) * 13 - 51" />
                                        <xsl:variable name="y2">
                                            <xsl:for-each select="/result/valores/entry">
                                                <xsl:if test="estado_ibge = $estado_atual">
                                                    <xsl:if test="ano = $estadoatual_ano + 1">
                                                        <xsl:value-of select="89.5 - valor * 7" />
                                                    </xsl:if>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <svg:line x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}" style="stroke:rgb(255,0,0);stroke-width:1" />


                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                            <!-- Linhas do gráfico -->
                        </svg:svg>
                    </div>
                </xsl:if>
            </xsl:for-each>

        </body>

        </html>


    </xsl:template>
</xsl:stylesheet>
