package firsttask;

public class TurnCommand implements RoverCommand {
    private Turnable roverTurn;
    Direction roverDirection;
        
    public TurnCommand(Turnable turn, Direction direction) {
        roverTurn = turn;
        roverDirection = direction;
    }
    
    @Override
    public void execute() {    
        roverTurn.turnTo(roverDirection);
    }
}
