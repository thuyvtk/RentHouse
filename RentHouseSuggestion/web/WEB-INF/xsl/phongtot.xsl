<?xml version="1.0"?>

<!--
    Document   : phongtot.xsl
    Created on : February 11, 2020, 11:42 AM
    Author     : ASUS
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:t="thuyvtk.xsd"
                xmlns="thuyvtk.xsd"
                xmlns:xh="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="t:house_phongtot">
        <xsl:variable name="listDoc" select="document(@link)"/>
        <xsl:variable name="host" select="@link"/>
        <xsl:variable name="link_phongtro" select="$listDoc//a[  span = 'Phòng trọ']/@href"/>
        <xsl:value-of select="thuy"/>
    </xsl:template>

</xsl:stylesheet>
