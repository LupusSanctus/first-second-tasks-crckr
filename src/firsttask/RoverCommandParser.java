package firsttask;

import java.util.List;
import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.*; 


public class RoverCommandParser {
    private Rover rover;
    private BufferedReader in;
    
    public RoverCommandParser(Rover rover, String fileName) throws FileNotFoundException {
        this.rover = rover;
        this.in = new BufferedReader(new FileReader(fileName));
    }
            
    public RoverCommand readNextCommand() throws IOException {  
        String buffer;
        String columns[];
        RoverCommand roverCommand = null;

        while((buffer =  in.readLine()) != null) {
            columns = buffer.split("\t");
            if(columns[0].equals("import")) {
                System.out.println("Debug: " + columns[0] + " " + columns[1]);
                if (columns[1].equals("")) throw new ArrayStoreException("Invalid import arguments!");
                roverCommand = new ImportCommand(this.rover, columns[0]);
                roverCommand.execute();
            } else if(!columns[0].startsWith("#")) {
                System.out.println("Debug: " + columns[0] + " " + columns[1]);
                String[] partsArgument;
                columns[1] = columns[1].replaceAll("\\s+","");
                
                switch (columns[0]) {
                    case "move":
                        // check if move args contains number
                        if(columns[1].matches(".*\\d+.*") && !columns[1].contains(",")) {
                            System.out.println("Function argument has wrong format! Fix it and try again.");
                            return null;
                        } 
                        partsArgument = columns[1].split(",");
                        int x, y;
                        x = Integer.parseInt(partsArgument[0]);
                        y = Integer.parseInt(partsArgument[1]);
                        
                        System.out.println("Debug: " + x + " " + y);                        
                        roverCommand = new MoveCommand(this.rover, x, y);
                        //common execute doesn`t work
                        roverCommand.execute();
                        break;
                        
                    case "turn":
                        Direction turnDirection = Direction.valueOf(columns[1]);
                        roverCommand = new TurnCommand(rover, turnDirection);
                        roverCommand.execute();
                        break;
                        
                    default:
                        System.out.println("No existing command in the current string!");
                        return null;                        
                } //switch
            } //else if
        } //while
        in.close();
        //for common execute in rover class
        return roverCommand; 
        
    } //readNextCommand
}
