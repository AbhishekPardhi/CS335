// A Java program to demonstrate working of recursion
class RecurseFunc {
    static void printFun(int test)
    {
        if (test < 1)
            return;
        else {
            System.out.println(test);
            printFun(test - 1);
            System.out.println(test);
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