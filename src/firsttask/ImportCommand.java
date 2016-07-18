package firsttask;

import java.util.List;
import java.io.IOException;

public class ImportCommand implements RoverCommand{
    private List<RoverCommand> commandList;
       
public ImportCommand(Rover rover, String file) throws IOException {
    RoverCommandParser programParser = new RoverCommandParser(rover, file);
    //XmlRoverCommandParser programParser = new XmlRoverCommandParser(rover, file);

    RoverCommand command;
    while (true) {
        command = programParser.readNextCommand();
        if (command == null) break;
        commandList.add(command);
    }
}
    
    @Override
    public void execute() {
        for(RoverCommand roverCmd : commandList) {
            roverCmd.execute();
        }
    }
    
}
