class Classes {
    public int s;
    public int t;
    public int mul(int a, int b) {
      int sum = a * b;
      return sum;
    }
    public static void main(String[] args) {
  
      Classes obj = new Classes();
      obj.s = 2;
      obj.t = 4;
      obj.s = obj.mul(obj.s, obj.t);
      println(obj.s); // Prints 8
  
    }
  }