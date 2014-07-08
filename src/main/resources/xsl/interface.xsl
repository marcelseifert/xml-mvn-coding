<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : interface.xsl
    Created on : 21. Juni 2014, 21:30
    Author     : Marcel
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="text"/>

<xsl:template match="/">
   
  
<xsl:text>
package org.marcel.xmlcodegeneration;
        
import org.marcel.xmlcodegeneration.model.*;
         
/**
*
*
</xsl:text>
<xsl:text>*</xsl:text><xsl:value-of select="service/description" />
<xsl:text>*</xsl:text><xsl:value-of select="service/author" />
<xsl:text>
*
*/   

</xsl:text>
public interface Service extends java.io.Serializable {
     
        <xsl:for-each select="service/operation">
        ahah
	        <xsl:if test="./outputMessage/@name">
	       	 <xsl:value-of select="./outputMessage/@name"/>
	        </xsl:if>
	        <xsl:if test="not(./outputMessage/@returnType)">
	          <xsl:text> void </xsl:text>
	        </xsl:if> 
          <xsl:value-of select="@name"/>(
    
          <xsl:for-each select="/service/operation/inputMessage">
	         <xsl:variable name="inputName" select="@name"/>
	         <xsl:variable name="inputLowerName" select="lower-case($inputName)"/>
	         <xsl:value-of select="$inputName"/>
	         <xsl:text> </xsl:text>
	         <xsl:value-of select="$inputLowerName"/> 
	         <xsl:if test="(following-sibling::inputMessage)">
	          <xsl:text>, </xsl:text>
	         </xsl:if>
           </xsl:for-each>
         
         );

        </xsl:for-each>
    <xsl:text>  
}
    </xsl:text>
    </xsl:template>
   
</xsl:stylesheet>
