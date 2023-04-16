// A Java program to demonstrate working of recursion
import static java.lang.System.out;

class RecurseFunc {
    static void printFun(int test)
    {
        if (test < 1)
            return;
        else {
            out.println(test);
            printFun(test - 1);
            out.println(test);
            return;
        }
    }
 
    // Driver Code
    public static void main(String[] args)
    {
        int test = 3;
        printFun(test);
    }
}