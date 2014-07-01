<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : interface.xsl
    Created on : 21. Juni 2014, 21:30
    Author     : Marcel
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
 <xsl:template match="/">
    <xsl:variable name="className" select="service/description/@className"/>
    <!--
    ********************************************************************
    ** Generate the class skeleton. Other templates will generate
    ** portions of the class.
    *****************************************************************-->
    <xsl:text>
        package org.marcel.xmlcodegeneration;
        
        import org.marcel.xmlcodegeneration.model.*;
        
    </xsl:text>
    
    public interface <xsl:value-of
             select="$className"/>
        <xsl:text> implements java.io.Serializable {
        </xsl:text>
        <xsl:for-each select="/service/operation"> 
               <xsl:value-of select="@returnType"/>
        <xsl:text> </xsl:text>
         <xsl:variable name="inputName" select="@inputType"/>
         <xsl:variable name="inputLowerName" select="lower-case(@inputType)"/>
         <xsl:value-of select="@name"/>( <xsl:value-of select="$inputName"/>
         <xsl:text>  </xsl:text>
         <xsl:value-of select="$inputLowerName"/> );

        </xsl:for-each>
    <xsl:text>  
}
    </xsl:text>
    </xsl:template>
   
</xsl:stylesheet>
