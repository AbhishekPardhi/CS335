/* Using interface */

interface Polygon {
  int dim;
  void getArea(int length, int breadth);
}

// implement the Polygon interface
class Rectangle implements Polygon {

  int dim;
  // implementation of abstract method
  public void getArea(int length, int breadth) {
    System.out.println("The area of the rectangle is " + (length * breadth));
    length=1;
    this.dim = 2;
    this.getArea(1,2);
  }
  int l;
  
}

class Main {
  public static void main(String[] args) {
    Rectangle r1 = new Rectangle();
    r1.getArea(5, 6);
    r1.dim = 1;
    System.out.println(r1.dim);
  }
}