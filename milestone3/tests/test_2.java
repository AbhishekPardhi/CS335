/* Using interface */

interface Polygon {
  int test;
  void getArea(int length, int breadth);
}

// implement the Polygon interface
class Rectangle implements Polygon {

  int test;
  // implementation of abstract method
  public void getArea(int length, int breadth) {
    System.out.println("The area of the rectangle is " + (length * breadth));
    length=1;
    this.test = 2;
    this.getArea(1,2);
  }
  
}

class Main {
  public static void main(String[] args) {
    Rectangle r1 = new Rectangle();
    r1.getArea(5, 6);
    r1.test = 1;
    System.out.println(r1.test);
  }
}