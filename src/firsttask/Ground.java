package firsttask;

public class Ground {
    private int length;
    private int width;
    
    private static final int SIZE = 100;
    
    private GroundCell[][] landscape = new GroundCell[SIZE][SIZE];
    
    public int getLength() {
        return length;
    }
    
    public int getWidth() {
        return width;
    }
    
    public GroundCell[][] getLandscape() {
        return landscape;
    }

    Ground(int len, int width) {
        this.length = len;
        this.width = width;
       
        for(int row = 0; row < length; row ++) {
               for(int col = 0; col < width; col ++) {         
                   landscape[row][col] = new GroundCell(row, col, CellState.FREE);
               }
        }
    }
}
