class Bullet extends Ball {
  int radius = 25;
  boolean toRemove = false;
  
  Bullet(float x, float y) {
    super(x, y, false);
  }
  
  void update() {
    this.y = this.y - 5;
    
    for (Meteor meteor : meteors) {
      if (this.hit(meteor)) {
        meteor.smashed();
        this.toRemove = true;
      }
    }
  }
  
  // arguments: input to a function
  // *pass in* an argument to a function
  // a function *returns* its output
  boolean hit(Meteor meteor) {
    float h = sqrt(pow(meteor.x - this.x, 2) + pow(meteor.y - this.y, 2));
    
    return h <= this.radius + meteor.radius;
  }
}
