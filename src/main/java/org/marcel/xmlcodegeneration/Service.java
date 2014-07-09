
package org.marcel.xmlcodegeneration;
         
         
/**
*
* Description:
*a description
*
*
* @Author PiMaster
*
*/   


public interface Service extends java.io.Serializable {
 
  java.lang.String buildStuff( 
          org.marcel.xmlcodegeneration.model.Customer customer,
	         org.marcel.xmlcodegeneration.model.Office office
              );
           
   void buildWithEmptyError( 
          
             ) throws java.lang.RuntimeException;
             
}
    