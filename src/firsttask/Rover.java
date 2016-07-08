package firsttask;
import java.util.*; 

public class Rover implements Turnable, Moveable {

    private int x;
    private int y;
    private Direction direction;
    
    GroundVisor gv = new GroundVisor();

    // getters
    public int getX() {
        return this.x;
    }
    
    public int getY() {
        return this.y;
    }
     
    public GroundVisor getGroundVisor() {
        return gv;
    }
    
    // basic methods
    public void move(int a, int b) {
        if(gv.hasObstacles(a, b)) {
            this.x = a;
            this.y = b;        
            Formatter form = new Formatter();
            form.format("Now my coordinates are (%d, %d)", x, y);
            System.out.println(form);            
        } else {
            System.out.println("Couldn`t make a movement - some obstacles"); 
        }
    }
    
    public void turnTo(Direction direct) {
        direction = direct;
        System.out.println("Now I`m going to the " + direction);      
    }

}
