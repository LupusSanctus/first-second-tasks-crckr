package firsttask;

public class LoggingCommand implements RoverCommand {
    private RoverCommand command;
    
    LoggingCommand(RoverCommand cmdConstruct) {
        this.command = cmdConstruct;
    }
    
    @Override
    public void execute() {
        this.command.execute();
        System.out.println(this.command);
    }
}
