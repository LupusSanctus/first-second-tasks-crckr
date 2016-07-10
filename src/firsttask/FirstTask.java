package firsttask;

public class FirstTask {

    public static void main(String[] args) {
       //Debugger.isEnabled();
        Rover rover = new Rover();
        rover.getGround().setGround(new Ground(5, 5));
        
        rover.executeProgramFile("command");
    }
}
