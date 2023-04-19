public class ArrayExample {
    
    public static void main(String[] args) {
      int arr[] = new int[9];
      arr[2] = 3;
      arr[4] = 5;
      arr[5] = arr[4] + arr[2];
      println(arr[5]); // Prints 8
    }
  }