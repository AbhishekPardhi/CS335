interface test {
    public static int sum(int a, int b);
}

class Stress implements test {
    public static int sum(int a , int b)
    {
        return a + b;
    }
    
    public static void main(String[] args) {
  
        int i = 1, j = 2;
        int k = i + j + (i + j + (i + j + (i + j + (i + j + (i + j + (i + j))))));
        println(k);

    }
  }