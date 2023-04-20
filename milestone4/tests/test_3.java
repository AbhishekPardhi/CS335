class Classes {
    public int add(int a, int b) {
  
      int sum = a + b;
      return sum;
    }
  
    public void square(int num) {
      int result = num * num;
      println("Value of result = ");
      println(result);    // prints 576
    }
    public static void main(String[] args) {
  
      Classes obj = new Classes();
  
      obj.square(obj.add(15, 9));
  
    }
    int s;
    int t;
  }