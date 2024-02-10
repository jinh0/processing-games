class Cannon extends Rectangle {
  ArrayList<Bullet> bullets = new ArrayList();

  int prevTime = 0;
  
  Cannon(int x, int y, int w, int h) {
    super(x, y, w, h, false);
  }
  
  void display() {
    super.display();
    
    text("Bullets: " + bullets.size(), 50, 50);
    
    for (Bullet bullet : bullets) {
      bullet.display();
    }
  }
  
  void update() {
    this.x = mouseX;
    
    if (millis() - prevTime >= 500) {
      Bullet b = new Bullet(this.x, this.y);
      bullets.add(b);
      
      prevTime = millis();
    }
    
    for (Bullet bullet : bullets) {
      bullet.update();
    }
    
    bullets.removeIf(bullet -> bullet.y < 0);
  }
}
