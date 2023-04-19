public class SwapNumbers {

    public static void main(String[] args) {

        int first = 120, second = 245;

        // Value of first is assigned to temporary
        int temporary = first;
        // Value of second is assigned to first
        first = second;
        // Value of temporary (which contains the initial value of first) is assigned to second
        second = temporary;
        
        println(first);
    }
}
