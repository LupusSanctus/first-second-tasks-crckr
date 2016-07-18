package firsttask;

public class GroundCell {
    private CellState state;
    private int x;
    private int y;
    
    public GroundCell(int row, int col, CellState state) {
        x = row;
        y = col;
        this.state = state;
    }
       
    public void setX(int x) {
        this.x = x;
    }
    
    public void setY(int y) {
        this.y = y;
    }
    
    public CellState getState() {
        return state;
    }
}
