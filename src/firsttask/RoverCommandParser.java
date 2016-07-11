package firsttask;

import java.util.List;
import java.util.ArrayList;

public class RoverCommandParser {
    private Rover rover;
    
    RoverCommandParser(Rover rover) {
        this.rover = rover;
    }
            
    public RoverCommand readNextCommand(String command, String argument) {       
        RoverCommand commands;
        List<RoverCommand> commandList = new ArrayList<RoverCommand>();
        LoggingCommand logging;
        ImportCommand importCmd;
        
        String[] partsArgument;
        argument = argument.replaceAll("\\s+","");
        
        // check if string contains number
        if(argument.matches(".*\\d+.*") && !argument.contains(",")) {
            System.out.println("Function argument has wrong format! Fix it and try again.");
            return null;
        }
        
        partsArgument = argument.split(",");
             
        switch(command) {
            case "move":
                commands = new MoveCommand(this.rover, Integer.parseInt(partsArgument[0]), Integer.parseInt(partsArgument[1]));
                commandList.add(commands);
                importCmd = new ImportCommand(commandList);
                
                // LoggingCommand
                logging = new LoggingCommand(commands);
                logging.execute();
                
                return importCmd;
                
            case "turn":
                commands = new TurnCommand(this.rover, Direction.valueOf(argument));
                commandList.add(commands);
                importCmd = new ImportCommand(commandList);
                
                // LoggingCommand
                logging = new LoggingCommand(commands);
                logging.execute();
                
                return importCmd;
                
            default:
                System.out.println("No existing command in the current string!");
                return null;
        }
    }
}
