public class MyClass {
    public int ankur=2;
    int x;
    double y;
    MyClass(int xx,double yy){
      x=xx;
      y=yy;
    }
    public void sayHello() {
        int acha=2;
    }
}
public class ExampleExpression {
    public static int something(int a){
      return a++;
    } 
    
    public static void main(String[] args) {
      // int x=0;
      // int arr[] = new int[3];
      // x=something(arr[2]);
      // MyClass myObject = new MyClass();
      // System.out.println(myObject.ankur);
      // myObject.ankur=2;
      // myObject.sayHello();
      MyClass myObject = new MyClass(2,3.14);
    }
  }