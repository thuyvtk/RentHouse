/* 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor. 
 */
package thuyvtk.utils;

import com.sun.codemodel.JCodeModel;
import com.sun.jmx.remote.internal.Unmarshal;
import com.sun.tools.xjc.api.ErrorListener;
import com.sun.tools.xjc.api.S2JJAXBModel;
import com.sun.tools.xjc.api.SchemaCompiler;
import com.sun.tools.xjc.api.XJC;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.namespace.QName;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import javax.xml.validation.SchemaFactory;
import org.xml.sax.InputSource;
import org.xml.sax.SAXParseException;
import thuyvtk.dao.HouseDAO;
import thuyvtk.jaxB.HouseItem;
import thuyvtk.jaxB.ListHouse;
import thuyvtk.validation.JAXBValidationHandler;

/**
 *
 * @author ASUS
 */
public class XMLHelper {

    public static void generateJAXB(String schemaFile, String realPath) {
        try {
            String output = "src/java/";
            SchemaCompiler schemaCompiler = XJC.createSchemaCompiler();
            schemaCompiler.setErrorListener(new ErrorListener() {
                @Override
                public void error(SAXParseException saxpe) {
                    System.out.println("error " + saxpe.getMessage());
                }

                @Override
                public void fatalError(SAXParseException saxpe) {
                    System.out.println("error " + saxpe.getMessage());

                }

                @Override
                public void warning(SAXParseException saxpe) {
                    System.out.println("error " + saxpe.getMessage());

                }

                @Override
                public void info(SAXParseException saxpe) {
                    System.out.println("error " + saxpe.getMessage());
                }
            });
            schemaCompiler.forcePackageName("thuyvtk.generate");
            File schema = new File(schemaFile);
            InputSource inputSource = new InputSource(schema.toURI().toString());
            schemaCompiler.parseSchema(inputSource);
            S2JJAXBModel model = schemaCompiler.bind();
            JCodeModel code = model.generateCode(null, null);
            code.build(new File(output));
        } catch (IOException ex) {
            Logger.getLogger(XMLHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static XMLEventReader parseFileToStaxIterator(InputStream inputStream) throws XMLStreamException {
        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLEventReader reader = factory.createXMLEventReader(inputStream);
        return reader;
    }

    public static String getAttributeNodeStaxValue(XMLEventReader reader, String elementName, String nameSpaceURI, String attrName) throws XMLStreamException {
        if (reader != null) {
            while (reader.hasNext()) {

                XMLEvent event = reader.peek();
                if (event.isStartElement()) {
                    StartElement startElement = (StartElement) event;
                    if (startElement.getName().getLocalPart().equals(elementName)) {
                        Attribute attribute = startElement.getAttributeByName(new QName(nameSpaceURI, attrName));
                        if (attribute != null) {
                            String value = attribute.getValue();
                            return value;
                        }
                    } // end if local part 
                } // end if start element 
                reader.nextEvent();
            }
        }
        return null;
    }

    public static String getTextStaxContent(XMLEventReader reader, String elementName) throws XMLStreamException {
        if (reader != null) {
            while (reader.hasNext()) {
                XMLEvent event = reader.nextEvent();
                if (event.isStartElement()) {
                    StartElement startElement = (StartElement) event;
                    if (startElement.getName().getLocalPart().equals(elementName)) {
                        event = reader.nextEvent();
                        Characters characters = (Characters) event;
                        String value = characters.getData();
                        reader.nextEvent();
                        return value;
                    }
                } // end if start element 
            }// end while 
        }
        return "";
    }

    public static void JAXBUnmarshallingHouse(String xmlFile) {
        try {
            JAXBContext context = JAXBContext.newInstance(ListHouse.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            
            unmarshaller.setEventHandler(new JAXBValidationHandler());

            File file = new File(xmlFile);
            ListHouse houses = (ListHouse) unmarshaller.unmarshal(file);
            for (int i = 0; i < houses.getHouse().size(); i++) {
                HouseItem item = houses.getHouse().get(i);
                HouseDAO houseDAO = new HouseDAO();
                System.out.println(houseDAO.insertHouse(item));
            }
        } catch (JAXBException ex) {
            Logger.getLogger(XMLHelper.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(XMLHelper.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(XMLHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        } 
}
