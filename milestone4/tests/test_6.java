interface test {
    public static int sum(int a, int b);
}

class InterfaceTest implements test {
    public static int sum(int a , int b)
    {
        return a + b;
    }
    
    public static void main(String[] args) {
        println(sum(6, 9)); // Prints 15
    }
  }