class Cannon extends Rectangle {
  ArrayList<Bullet> bullets = new ArrayList();

  int prevTime = 0;
  
  Cannon(int x, int y, int w, int h) {
    super(x, y, w, h, false);
  }
  
  void display() {
    super.display();
    
    for (Bullet bullet : bullets) {
      bullet.display();
    }
  }
  
  void update() {
    this.x = mouseX;
    
    for (Meteor meteor : meteors) {
      if (this.hit(meteor)) {
        // game over!
        isGameOver = true;
      }
    }
    
    
    if (millis() - prevTime >= 300) {
      Bullet b = new Bullet(this.x, this.y);
      bullets.add(b);
      
      prevTime = millis();
    }
    
    for (Bullet bullet : bullets) {
      bullet.update();
    }
    
    bullets.removeIf(bullet -> bullet.y < 0 || bullet.toRemove);
  }
  
  boolean hit(Meteor meteor) {
    // Calculate the distance between the center of the meteor and the closest point on the rectangle
    float closestX = this.x;
    float closestY = this.y;
    
    if (abs(meteor.x - (this.x + this.w)) <= abs(meteor.x - this.x)) {
      closestX = this.x + this.w;
    }
    
    if (abs(meteor.y - (this.y + this.h)) <= abs(meteor.y - this.y)) {
      closestY = this.y + this.h;
    }

    // Calculate the distance between the meteor's center and the closest point on the rectangle
    float distanceX = meteor.x - closestX;
    float distanceY = meteor.y - closestY;

    // Use Pythagorean theorem to calculate the distance between the meteor's center and the closest point on the rectangle
    float distance = sqrt(distanceX * distanceX + distanceY * distanceY);

    // Check if the distance is less than the meteor's radius
    return distance < meteor.radius;
  }
}
