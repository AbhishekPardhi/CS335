public class MyClass {
    public int ankur;
    public void sayHello() {
        int acha=2;
    }
}
public class ExampleExpression {
    public static int something(int a){
      return a++;
    } 
    
    public static void main(String[] args) {
      int x=0;
      int arr[] = new int[3];
      x=something(arr[2]);
    MyClass myObject = new MyClass();
    myObject.ankur=0;
    System.out.println(myObject.ankur);
    // myObject.sayHello();
    }
  }