package firsttask;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*; 

public class Rover implements Turnable, Moveable, ProgramFileAware {

    private int x;
    private int y;
    private Direction direction;
    private RoverCommandParser commandParser;
    
    GroundVisor groundVisor = new GroundVisor();
    
    public void setX(int x) {
        this.x = x;
    }
    
    public void setY(int y) {
        this.y = y;
    }
       
    public int getX() {
        return this.x;
    }
    
    public int getY() {
        return this.y;
    }
    
    public GroundVisor getGround() {
        return groundVisor;
    }
    
    @Override
    public void move(int x, int y) {
        Formatter form = new Formatter();
        if(!groundVisor.hasObstacles(x, y)) {
            this.x = x;
            this.y = y;        
            form.format("now my coordinates are (%d, %d)", x, y);
            System.out.println(form);            
        } else {
            form.format("Couldn`t make a movement - some obstacles are here(%d, %d)!", x, y);
            System.out.println(form); 
        }
    }
    
    @Override
    public void turnTo(Direction direct) {
        this.direction = direct;
        System.out.println("Now I`m going to the " + direction);      
    }
   
    // devide the input file structe into two basic components: main text, subtext(import)
    @Override
    public void executeProgramFile(String fileName) {
        String buffer;
        // two columns: command and arguments
        String columns[];
        
        commandParser = new RoverCommandParser(this);
        try {
            BufferedReader in = new BufferedReader(new FileReader(fileName));
            while((buffer =  in.readLine()) != null) {
                columns = buffer.split("\t");
                if(columns[0].equals("import")) { 
                    executeProgramFile(columns[1]);
                } else if(!columns[0].startsWith("#")) {
                    commandParser.readNextCommand(columns[0], columns[1]).execute();
                }
            }
            in.close();
        } 
        catch(IOException e) {
            e.getStackTrace();
        }
        catch (Exception e) {
            e.printStackTrace();
        }       
    }
}
