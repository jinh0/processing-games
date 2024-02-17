class Meteor extends Ball {
  int hp = 100;
  int radius = 25;
  
  boolean toRemove = false;

  // constructor: the function to make a new Meteor
  Meteor(float x, float y) {
    super(x, y, true);
    this.speedX = 2;
    
    meteors.add(this);
  }

  void display() {
    super.display(); // display ball first

    fill(0);
    text(this.hp, this.x, this.y);
    fill(255);
  }
  
  void smashed() {
    this.hp = this.hp - 20;
  }
  
  void update() {
    super.update();
    
    if (this.hp <= 0) {
      this.toRemove = true;
    }
  }
}
