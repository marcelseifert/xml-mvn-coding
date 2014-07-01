
package org.marcel.xmlcodegeneration;
        
import org.marcel.xmlcodegeneration.model.*;
import org.marcel.xmlcodegeneration.model.base.*;  

    
public interface Service extends java.io.Serializable {
         
        String buildStuff( Person  person );

        String transformStuff( Kunde  kunde );

          
}
    