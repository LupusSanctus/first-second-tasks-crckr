package firsttask;

public class GroundVisor {
    private Ground ground;
    
    public Ground getGround() {
        return ground;
    }

    public void setGround(Ground ground) {
        this.ground = ground;
    }
    
    public boolean hasObstacles(int x, int y) {
        if(Debugger.debugStat) {
            Debugger.info(ground.getLength());
            Debugger.info(ground.getWidth());
            Debugger.info(x);
            Debugger.info(y);
        }
       
        if(ground.getLength() < x || x < 0 || ground.getWidth() < y || y < 0)
            throw new GroundVisorException("Movement is out of bounds or wrong inputcoordinates!");
        else {
            System.out.println("No obstacles here:");            
            return ground.getLandscape()[x][y].getState() == CellState.OCCUPIED;
        }
    }
}
