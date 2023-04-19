// A Java program to demonstrate working of recursion
class RecurseFunc {
    static void printFun(int test)
    {
        if (test < 1)
            return;
        else {
            println(test);
            printFun(test - 1);
            println(test);
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