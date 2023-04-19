class Classes {
    // calculate the sum
    public int add(int a, int b) {
  
      // calculate sum
      int sum = a + b;
      return sum;
    }
  
    // calculate the square
    public void square(int num) {
      int result = num * num;
      println(result);    // prints 576
    }
    public static void main(String[] args) {
  
      Classes obj = new Classes();
  
      obj.square(obj.add(15, 9));
  
    }
    int s;
    int t;
  }