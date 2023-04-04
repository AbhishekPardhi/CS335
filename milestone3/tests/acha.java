public class MyClass {
    int l;
    int x;
    double y;
    MyClass(int xx,double yy){
      x=2;
      this.y=xx;
      // this.y=yy;
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
      int arr[] = new int[6];
      // x=something(arr[2]);
      // MyClass myObject = new MyClass();
      // System.out.println(myObject.ankur);
      // myObject.l=2;
      // myObject.sayHello();
      // MyClass myObject = new MyClass(2,3.14);
      int x = 2;
      arr[2]=x;
      // something(arr[0][1][2]);
    }
  }