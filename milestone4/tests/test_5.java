class Stress {

    public static void main(String[] args) {
  
        int i = 1, j = 2;
        int k = i + j + (i + j + (i + j + (i + j + (i + j + (i + j + (i + j))))));
        println("Value of k = ");
        println(k); // Prints 21
    }
  }