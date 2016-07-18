package firsttask;


import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.*;
import org.xml.sax.*;
import org.xml.sax.helpers.DefaultHandler;
import java.util.List;
import java.util.ArrayList;
 

public class XmlRoverCommandParser {
    private Rover rover;
    public static boolean isXmlParser = false;
    
    private List<RoverCommand> roverCommandList;
    private int count = 0;

    public XmlRoverCommandParser(Rover rover, String file) {
        this.rover = rover;
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = null;
        try {
            parser = factory.newSAXParser();
            SAXPar saxp = new SAXPar(rover);
            parser.parse(new File(file), saxp);
            this.roverCommandList = saxp.commands;
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public RoverCommand readNextCommand() {
        return this.roverCommandList.size() > this.count ? this.roverCommandList.get(count++) : null;
    }


    public class SAXPar extends DefaultHandler {
        public List<RoverCommand> commands = new ArrayList<>();
        private Rover rover;

        public SAXPar(Rover rover) {
            super();
            this.rover = rover;
        }

        //public void startElement(String namespaceURI, String localName, String qName, Attributes atts) throws SAXException {
        public void startElement(String tagName, Attributes attrib) throws SAXException {
            String[] tagArray;
            tagArray = tagName.split(" ");

            if (tagName.equals("command")) {
                RoverCommand roverCommand = null;
                switch (attrib.getValue("type")) {
                    case "move":
                        String[] argArray;
                        argArray = (attrib.getValue("type").replaceAll("\\s+","")).split(",");

                        int x = Integer.parseInt(argArray[0]);
                        int y = Integer.parseInt(argArray[1]);
                        roverCommand = new MoveCommand(rover, x, y);
                        break;
                    case "turn":
                        roverCommand = new TurnCommand(rover, Direction.valueOf(attrib.getValue("direction")));
                        break;
                    case "import":
                        try {
                            roverCommand = new ImportCommand(rover, attrib.getValue("filename"));
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        break;
                    default:
                        System.out.println("No existing command in the current string!");
                }
                commands.add(roverCommand);
            }
        }
}
}