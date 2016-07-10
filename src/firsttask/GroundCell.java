package firsttask;

public class GroundCell {
    private CellState state;
    private int x;
    private int y;
    
    GroundCell(int row, int col, CellState state) {
        this.x = row;
        this.y = col;
        this.state = state;
    }
       
    public void setX(int x) {
        this.x = x;
    }
    
    public void setY(int y) {
        this.y = y;
    }
    
    public CellState getState() {
        return this.state;
    }
}
