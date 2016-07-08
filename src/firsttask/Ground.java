package firsttask;

public class Ground {
    private int length;
    private int width;
    
    private static final int SIZE = 100;
    
    private GroundCell[][] landscape = new GroundCell[SIZE][SIZE];
    
    // setters
    public int getLength() {
        return length;
    }
    
    public int getWidth() {
        return width;
    }
    
//    public CellState getGroundСellState() {
//        return state;
//    }
    
    // constructor
    Ground(int len, int width) {
        this.length = len;
        this.width = width;
        
        GroundCell gc = new GroundCell();
        CellState st = CellState.FREE;
        gc.setState(st);
        
        for(int row = 0; row < length; row ++) {
               for(int col = 0; col < width; col ++) {         
                   landscape[row][col] = gc;
               }
        }
    }
}
