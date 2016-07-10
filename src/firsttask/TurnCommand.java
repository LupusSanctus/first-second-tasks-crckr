package firsttask;

public class TurnCommand implements RoverCommand {
    private Turnable roverTurn;
    // for advanced constructor
    Direction roverDirection;
        
    TurnCommand(Turnable turn, Direction direction) {
        this.roverTurn = turn;
        this.roverDirection = direction;
    }
    
    @Override
    public void execute() {    
        this.roverTurn.turnTo(this.roverDirection);
    }
}
