package firsttask;

public class FirstTask {

    public static void main(String[] args) {
       //Debugger.isEnabled();
        
        Rover r = new Rover();
        r.getGroundVisor().setGround(new Ground(5, 5));
        
        // enum
        Direction d;
        d = Direction.NORTH;
        
        // movement coordinates
        int a = 3;
        int b = 4;
        
        // call Rover methods 
        r.move(a, b);
        r.turnTo(d);
    }
    
}
