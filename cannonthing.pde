ArrayList<Meteor> meteors = new ArrayList();

Cannon cannon = new Cannon(300, 500, 50, 100);
Meteor m1 = new Meteor(100, 100);
Meteor m2 = new Meteor(300, 0);

void setup() {
  frameRate(60);
  size(500, 600);
  textSize(30);

  meteors.add(m1);
  meteors.add(m2);
}

void draw() {
  background(#74E2FF);
  
  cannon.display();
  cannon.update();
  
  for (Meteor meteor : meteors) {
    meteor.display();
  }
  
  for (Meteor meteor : meteors) {
    meteor.update();
  }
  
  meteors.removeIf(meteor -> meteor.toRemove);
}
