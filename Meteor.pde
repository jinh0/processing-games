class Meteor extends Ball {
  int hp = 100;
  int radius = 50;

  Meteor(int x, int y) {
    super(x, y, false);
    this.speedX = 5;
  }

  void display() {
    super.display(); // display ball first

    fill(0);
    text(this.hp, this.x, this.y);
    fill(255);
  }
}
