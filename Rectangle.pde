class Rectangle extends Shape {
  int w;
  int h;
  
  Rectangle(int x, int y, int w, int h, boolean hasGravity) {
    super(x, y, hasGravity);
    
    this.w = w;
    this.h = h;
  }
  
  void display() {
    rect(x, y, w, h);
  }
  
}
