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

    <xsl:template match="t:house_phongtot">
        <xsl:variable name="listDoc" select="document(@link)"/> 
        <xsl:variable name="host" select="@link"/> 
        <xsl:variable name="room_page_1" select="document($listDoc//ul[@class='nav navbar-nav']//a[ text()='Phòng trọ']/@href)"/>
        <xsl:element name="roomList"> 
            <!--            
            <xsl:call-template name="GetLinkNextPage">
                <xsl:with-param name="currentPage" select="$room_page_1"/>
            </xsl:call-template>-->
            
            <!--list room in page 1-->
            <xsl:element name="page">
                <xsl:attribute name="no">1</xsl:attribute>
                <xsl:for-each select="$room_page_1//div[@class='room-item']//div[@class='block-room-item-title']//a[contains(@href,'http')]"> 
                    <xsl:element name="house"> 
                        <xsl:attribute name="href">
                            <xsl:value-of select="./@href"/> 
                        </xsl:attribute>
                    </xsl:element> 
                </xsl:for-each>
            </xsl:element>
            
            <!--get page 1-8-->
            <xsl:for-each select="$room_page_1//ul[@class='pagination']//a[@rel='next']">
            <!--<xsl:for-each select="$room_page_1//ul[@class='pagination']//a[not(@rel='next')]">-->
                <!--<xsl:if test="substring-after(./@href, '?page=') &lt; 9">-->
                    <xsl:element name="page">
<!--                        <xsl:attribute name="no">
                            <xsl:value-of select="substring-after(./@href, '=')"/>
                        </xsl:attribute>-->
                        <xsl:call-template name="GetLinkPaging">
                            <xsl:with-param name="link" select="./@href"/>
                        </xsl:call-template>
                    </xsl:element>
                <!--</xsl:if>-->
            </xsl:for-each>
        
        </xsl:element>
    </xsl:template> 
    
    
    <xsl:template name="GetLinkPaging">
        <xsl:param name="link" select="'No parameter'"/>
        <xsl:attribute name="href">
            <xsl:value-of select="$link"/>
        </xsl:attribute>
    </xsl:template><!--create attr href-->
    
    
    <xsl:template name="GetLinkNextPage">
        <xsl:param name="currentPage"/>
        <xsl:if test="not (contains($currentPage,'?page='))">
            <xsl:element name="page">
                <xsl:attribute name="no">
                    <xsl:value-of select="'2'"/>
                </xsl:attribute>
                <xsl:value-of select="document($currentPage//ul[@class='pagination']//a[@rel='next']/@href)"/>
            </xsl:element>
        </xsl:if>
        
        <xsl:if test="substring-after($currentPage, '?page=') &lt; 36">
            <xsl:element name="page">
                <xsl:attribute name="no">
                    <xsl:value-of select="substring-after($currentPage, '?page=') + 1"/>
                </xsl:attribute>
                <xsl:value-of select="document($currentPage//ul[@class='pagination']//a[@rel='next']/@href)"/>
            </xsl:element>
        </xsl:if>
        <xsl:call-template name="GetLinkNextPage">
            <xsl:with-param name="currentPage" select="$currentPage//ul[@class='pagination']//a[@rel='next']/@href"/>
        </xsl:call-template>
    </xsl:template><!--get link next page-->
    
    
    <xsl:template name="GetNextPages">
        <xsl:param name="currentPage" select="'No param'"/>
        
        <xsl:choose>
            <xsl:when test="not (contains($currentPage,'?page='))">
                <xsl:element name="page">
                    
                    <!--                    <xsl:attribute name="no">1</xsl:attribute>
                    <xsl:for-each select="$currentPage//div[@class='room-item']//div[@class='block-room-item-title']//a[contains(@href,'http')]"> 
                        <xsl:element name="house"> 
                            <xsl:attribute name="href">
                                <xsl:value-of select="./@href"/> 
                            </xsl:attribute>
                        </xsl:element> 
                    </xsl:for-each>-->
                </xsl:element>
            </xsl:when>
            <!--end get list rooms in first page-->
        </xsl:choose>        
    </xsl:template><!--get next pages-->

</xsl:stylesheet>
