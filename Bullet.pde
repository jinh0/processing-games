class Bullet extends Ball {
  int radius = 50;
  
  Bullet(float x, float y) {
    super(x, y, false);
  }
  
  void update() {
    this.y = this.y - 5;
    
    // if i hit a meteor, then I'm going to tell the meteor that i hit it
    for (Meteor meteor : meteors) {
      if (this.hit(meteor)) {
        //meteor.smashed();
        cannon.bullets.remove(this);
      }
    }
  }
  
  boolean hit(Meteor meteor) {
    return sqrt(pow(meteor.x - this.x, 2) + pow(meteor.y - this.y, 2)) <= meteor.radius + this.radius;
  }
}
