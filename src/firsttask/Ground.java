package firsttask;

public class Ground {
    private int length;
    private int width;
        
    private GroundCell[][] landscape;
    
    public int getLength() {
        return length;
    }
    
    public int getWidth() {
        return width;
    }
    
    public GroundCell[][] getLandscape() {
        return landscape;
    }

    public Ground(int len, int width) {
        length = len;
        this.width = width;
        landscape = new GroundCell[length][this.width];
        
        for(int row = 0; row < length; row ++) {
               for(int col = 0; col < this.width; col ++) {         
                   landscape[row][col] = new GroundCell(row, col, CellState.FREE);
               }
        }
    }
}
