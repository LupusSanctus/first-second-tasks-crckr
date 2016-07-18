package firsttask;

public class LoggingCommand implements RoverCommand {
    private RoverCommand command;
    
    public LoggingCommand(RoverCommand cmdConstruct) {
        command = cmdConstruct;
    }
    
    @Override
    public void execute() {
        command.execute();
        
        System.out.println(command.getClass());
    }
}
