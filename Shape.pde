// Shape (has hit detection and optional gravity)
// -> Ball      -> Meteor, Bullet
// -> Rectangle -> Cannon

class Shape {
  float x;
  float y;

  float gravity = 1;
  float speedY;
  float speedX;

  boolean hasGravity = false;

  Shape(float x, float y, boolean hasGravity) {
    this.x = x;
    this.y = y;
    this.hasGravity = hasGravity;
  }
  
  void display() {}

  void update() {
    if (hasGravity) {
      this.gravityUpdate();
    }
  }

  void gravityUpdate() {
    this.speedY = this.speedY + gravity;
    this.y = this.y + this.speedY;

    this.x = this.x + this.speedX;

    if (this.y > height) {
      this.y = height;
      this.speedY = -this.speedY * 0.8;
    }

    if (this.x < 0) {
      this.x = 0;
      this.speedX = -this.speedX;
    }

    if (this.x > width) {
      this.x = width;
      this.speedX = -this.speedX;
    }
  }

  boolean hit(Shape other) {
    return false;
  }

  void onHit(Shape other) {
    this.speedX = -this.speedX;
    this.speedY = -this.speedY;
  }
}
