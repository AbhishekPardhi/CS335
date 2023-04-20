interface test {
    public static int sum(int a, int b);
}

class Stress implements test {
    public static int sum(int a , int b)
    {
        return a + b;
    }
    
    public static void main(String[] args) {
        println(sum(6, 9));
    }
  }