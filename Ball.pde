class Ball extends Shape {
  Ball(float x, float y, boolean hasGravity) {
    super(x, y, hasGravity);
  }

  void display() {
    ellipse(this.x, this.y, 50, 50);
  }

  boolean hit(Shape other) {
    if (other instanceof Rectangle) {
      Rectangle r = (Rectangle) other;
      
      // temporary variables to set edges for testing
      float testX = (this.x <= r.x) ? r.x : r.x + r.w;
      float testY = (this.y <= r.y) ? r.y : r.y + r.h;

      // get distance from closest edges
      float distX = this.x - testX;
      float distY = this.y - testY;
      float distance = sqrt( (distX*distX) + (distY*distY) );

      // if the distance is less than the radius, collision!
      return distance <= 25;
    } else if (other instanceof Ball) {
      return sqrt(pow(this.x - other.x, 2) + pow(this.y - other.y, 2)) <= 50;
    } else {
      return false;
    }
  }
}
