/* Using interface */

interface Polygon {
  int dim;
  void getArea(int length, int breadth);
}

// implement the Polygon interface
class Rectangle implements Polygon {

  int no;
  // implementation of abstract method
  public void getArea(int length, int breadth) {
    println("The area of the rectangle is " + (length * breadth));
  }  
  int dim;
  Rectangle(int s){
    this.dim = s;
    int x = 20;
  }
}

class Main {
  public static void main(String[] args) {
    Rectangle r1 = new Rectangle();
    r1.getArea(5, 6);
    r1.dim = 1;
    println(r1.dim);
  }
}