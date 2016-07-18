package firsttask;

public class FirstTask {

    public static void main(String[] args) {
        //Debugger.isEnabled();
        Rover rover = new Rover();
        rover.getGround().setGround(new Ground(10, 10));

        rover.executeProgramFile("command");
        
    }
}
