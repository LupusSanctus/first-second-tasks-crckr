package firsttask;

public class GroundVisor {
    private Ground ground;
    
    // getter
    public Ground getGroundVisor() {
        return ground;
    }

    public void setGround(Ground grnd) {
        this.ground = grnd;
    }
    
    public boolean hasObstacles(int a, int b) {
        if(Debugger.debugStat) {
            Debugger.info(ground.getLength());
            Debugger.info(ground.getWidth());
            Debugger.info(a);
            Debugger.info(b);
        }
       
        if(ground.getLength()<a || ground.getWidth()<b) throw new GroundVisorException("Movement is out of bounds");
        else {
            System.out.println("No obstacles");            
            return true;
        }
    }
}
