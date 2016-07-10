package firsttask;

public class MoveCommand implements RoverCommand {
    private Moveable roverMove;
    // movement coordinates
    private int x;
    private int y;
    
    // advanced constructor version with movement coordinates
    MoveCommand(Moveable move, int x, int y) {
        this.roverMove = move;
        this.x = x;
        this.y = y;
    }
    
    @Override
    public void execute() {
        this.roverMove.move(this.x, this.y);
    }  
}
