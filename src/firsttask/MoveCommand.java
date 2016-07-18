package firsttask;

public class MoveCommand implements RoverCommand {
    private Moveable roverMove;
    // movement coordinates
    private int x;
    private int y;
    
    // advanced constructor version with movement coordinates
    public MoveCommand(Moveable move, int x, int y) {
        roverMove = move;
        this.x = x;
        this.y = y;
    }
    
    @Override
    public void execute() {
        roverMove.move(this.x, this.y);
    }  
}
