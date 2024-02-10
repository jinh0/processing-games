ArrayList<Shape> objects = new ArrayList();

ArrayList<Meteor> meteors = new ArrayList();

Cannon cannon = new Cannon(300, 500, 50, 100);
Meteor m1 = new Meteor(500, 300);
Meteor m2 = new Meteor(300, 300);

void setup() {
  frameRate(60);
  size(1000, 600);
  textSize(40);
  
  objects.add(cannon);
  objects.add(m1);
  objects.add(m2);
  
  m1.hp = 200;
}

void draw() {
  background(#74E2FF);
  
  for (Shape object : objects) {
    object.display();
  }
  
  for (Shape object : objects) {
    object.update();
  }
  
  //detectHit();
}

void detectHit() {
  for (Shape object : objects) {
    for (Shape other : objects) {
      if (object != other && object.hit(other)) {
        object.onHit(other);
      }
    }
  }
}

void meteorShower() {
  for (int i = 0; i < 10; i ++) {
    Meteor b = new Meteor(i * 75, i * 10);
    objects.add(b);
  }
  
  for (int i = 0; i < 10; i ++) {
    Meteor b = new Meteor(i * 100, i * 10 + 100);
    objects.add(b);
  }
}
