package firsttask;
       
public class RoverCommandParser {
    private Rover rover;
    
    RoverCommandParser(Rover rover) {
        this.rover = rover;
    }
            
    public RoverCommand readNextCommand(String command) {
        //RoverCommand VOID_COMMAND = () -> {};
        String[] parts = command.split(" ");      
        switch(parts[0]) {
            case "move":
                return new MoveCommand(this.rover, Integer.parseInt(parts[1]), Integer.parseInt(parts[2]));
            case "turn":
                return new TurnCommand(this.rover, Direction.valueOf(parts[1]));
            default:
                System.out.println("No existing command in the current string!");
                //return VOID_COMMAND;
                return null;
        }
    }
}
