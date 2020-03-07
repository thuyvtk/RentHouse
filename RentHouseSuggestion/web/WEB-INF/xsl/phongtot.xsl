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
            <xsl:element name="page">
                <xsl:attribute name="page_number">1</xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:value-of select="$listDoc//ul[@class='nav navbar-nav']//a[ text()='Phòng trọ']/@href"/>
                </xsl:attribute>
<!--                <xsl:for-each select="$room_page_1//div[@class='room-item']//div[@class='block-room-item-title']//a[contains(@href,'http')]"> 
                    <xsl:element name="house"> 
                        <xsl:attribute name="href">
                            <xsl:value-of select="./@href"/> 
                        </xsl:attribute>
                    </xsl:element> 
                </xsl:for-each>-->
            </xsl:element>
                <xsl:value-of select="'thuy'"/>
            
            <!--get page 1-8-->
            <!--<xsl:for-each select="$room_page_1//ul[@class='pagination']//a[@rel='next']">-->
            <xsl:for-each select="$room_page_1//ul[@class='pagination']//a[not(@rel='next')]">
                <xsl:if test="substring-after(./@href, '?page=') &lt; 9">
                        <xsl:call-template name="GetLinkPaging">
                            <xsl:with-param name="link" select="./@href"/>
                        </xsl:call-template>
                        <xsl:if test="substring-after(./@href, '?page=') = 8">
                            <xsl:call-template name="GetListLinkNextPages">
                                <xsl:with-param name="page" select="substring-after(./@href, '?page=')"/>
                                <xsl:with-param name="linkCurrentPage" select="document(./@href)"/>
                            </xsl:call-template>
                        </xsl:if>
                </xsl:if>
            </xsl:for-each>
        
        </xsl:element>
    </xsl:template> 
    
    <xsl:template name="GetListLinkNextPages">
        <xsl:param name="page" select="1"/>
        <xsl:param name="linkCurrentPage"/>
                <xsl:for-each select="$linkCurrentPage//ul[@class='pagination']//a[not(@rel='next') and not(@rel='prev')]">
                    <xsl:if test="substring-after(./@href, '?page=') &gt; $page">
                        <xsl:call-template name="GetLinkPaging">
                            <xsl:with-param name="link" select="./@href"/>
                        </xsl:call-template>
                        <xsl:if test="$page &lt; 36">
                            <xsl:if test="substring-after(./@href, '?page=') = $page+3">
                                <xsl:call-template name="GetListLinkNextPages">
                                    <xsl:with-param name="page" select="substring-after(./@href, '?page=')"/>
                                    <xsl:with-param name="linkCurrentPage" select="document(./@href)"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template name="GetLinkPaging">
        <xsl:param name="link" select="'No parameter'"/>
        <xsl:variable name="pageNumber" select="substring-after($link, '?page=')"/>
        <xsl:if test="$pageNumber &lt; 36">
            <xsl:element name="page">
            <xsl:attribute name="page_number">
                <xsl:value-of select="$pageNumber"/>
            </xsl:attribute>
            <xsl:attribute name="href">
            <xsl:value-of select="$link"/>
            </xsl:attribute>
            </xsl:element>
        </xsl:if>
    </xsl:template><!--create attr href-->
    
    
<!--    <xsl:template name="GetLinkNextPage">
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
    </xsl:template>get link next page
    
    
    <xsl:template name="GetNextPages">
        <xsl:param name="currentPage" select="'No param'"/>
        
        <xsl:choose>
            <xsl:when test="not (contains($currentPage,'?page='))">
                <xsl:element name="page">
                    
                                    <xsl:attribute name="no">1</xsl:attribute>
                <xsl:for-each select="$currentPage//div[@class='room-item']//div[@class='block-room-item-title']//a[contains(@href,'http')]"> 
                    <xsl:element name="house"> 
                        <xsl:attribute name="href">
                            <xsl:value-of select="./@href"/> 
                        </xsl:attribute>
                    </xsl:element> 
                </xsl:for-each>
            </xsl:element>
        </xsl:when>
        end get list rooms in first page
    </xsl:choose>        -->
    <!--</xsl:template>get next pages-->

</xsl:stylesheet>
