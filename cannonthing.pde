ArrayList<Meteor> meteors = new ArrayList();

Cannon cannon = new Cannon(300, 500, 50, 100);
Meteor m1 = new Meteor(100, 100);
Meteor m2 = new Meteor(300, 0);

boolean isGameOver = false;

void setup() {
  frameRate(60);
  size(500, 600);
  textSize(30);
}

void playGame() {
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

void gameOver() {
  text("GAME OVER! SUCKERRRRRRRRRRRRRRRRRRRR", 50, 300);
}

void draw() {
  if (!isGameOver) {
    playGame();
  } else {
    gameOver();
  }
}
