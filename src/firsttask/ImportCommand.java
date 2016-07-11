package firsttask;

import java.util.List;

public class ImportCommand implements RoverCommand{
    private List<RoverCommand> commandList;
    
    ImportCommand(List<RoverCommand> commandList) {
        this.commandList = commandList;
    }
       
    @Override
    public void execute() {
        for(RoverCommand roverCmd : commandList) {
            roverCmd.execute();
        }
    }
    
}
