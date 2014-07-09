<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : interface.xsl
    Created on : 21. Juni 2014, 21:30
    Author     : Marcel
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:x="http://xmlcodegeneration.marcel.org" exclude-result-prefixes="x" >
<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:output method="text"/> 


<xsl:template match="/">
<xsl:text>
package org.marcel.xmlcodegeneration;
         
         
/**
*
* Description:
</xsl:text>
<xsl:text>*</xsl:text> <xsl:value-of select="x:service/x:description" />
*
*
<xsl:text>*</xsl:text> @Author <xsl:value-of select="x:service/x:author" />
<xsl:text>
*
*/   

</xsl:text>
public interface Service extends java.io.Serializable {
 <xsl:for-each select="x:service/x:operation">
  <xsl:text>
  </xsl:text>        
	        <xsl:if test="./x:outputMessage/@package">
 <xsl:value-of select="./x:outputMessage/@package"/>.<xsl:value-of select="./x:outputMessage/@type"/>
	         <xsl:text> </xsl:text>
	        </xsl:if>
	        <xsl:if test="not(./x:outputMessage/@package)">
 <xsl:text> void </xsl:text>
	        </xsl:if> 
          <xsl:value-of select="@name"/>( 
          <xsl:for-each select="./x:inputMessage">
	         <xsl:variable name="inputName" select="@type"/>
	         <xsl:variable name="inputLowerName" select="lower-case($inputName)"/>
	         <xsl:value-of select="@package"/>.<xsl:value-of select="@type"/> 
	         <xsl:text> </xsl:text>
	         <xsl:value-of select="$inputLowerName"/> 
	         <xsl:if test="(following-sibling::x:inputMessage)">
	         <xsl:text>,
	         </xsl:text>
	         </xsl:if>
           </xsl:for-each>  
           <xsl:if test="./x:errorMessage">
             ) throws <xsl:value-of select="./x:errorMessage/@package"/>.<xsl:value-of select="./x:errorMessage/@type"/>;
           </xsl:if>
           <xsl:if test="not(./x:errorMessage)">
              );
           </xsl:if>

        </xsl:for-each>
    <xsl:text>  
}
    </xsl:text>
    </xsl:template>
   
</xsl:stylesheet>
