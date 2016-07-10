package firsttask;

// for debug prints
public class Debugger{
    public static boolean debugStat = false;
    
    public static void isEnabled(){
        debugStat = true;
    }

    public static void info(Object o){
        System.out.println(o.toString());
    }
}