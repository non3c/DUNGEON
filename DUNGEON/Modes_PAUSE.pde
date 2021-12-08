//pause screen
void pause() {
  pauseScreen();
  showButtons();
  clickButtons();
  quitPause();
}

void pauseScreen() {
  rectMode(CENTER);
  fill(#363636, 30);
  noStroke();
  rect(width/2, height/2, width, height);
  fill(#ffffff);
  stroke(#797979);
  strokeWeight(12);
  rect(width/2, height/2, width/1.35, height/1.35);
  textFont(PixelBoy);
  textSize(84);
  fill(ORANGE);
  text("Your Experience: " + myHero.xp, width/2, height/4);
  textAlign(CORNER);
  textSize(48);
  fill(YELLOW);
  text("Eat Carrots, Get Healthy! [5xp]", 350, 300);
  text("Eat Beef, Get Strong! [10xp]", 350, 380);
  textSize(24);
  text("Health Limit: " + myHero.hpMax, 350, 320);
  text("Roll Cooldown: " + myHero.rollThreshold, 350, 400);
}

void showButtons() {
  exitButton.show();
  addHPButton.show();
  addRollButton.show();
}

void clickButtons() {
  if (myHero.xp > 0) {
    if (addHPButton.clicked && myHero.xp >= 5) {
      myHero.xp -= 5;
      myHero.hpMax += 5;
    } else if (addRollButton.clicked && myHero.xp >= 10) {
      myHero.xp -= 10;
      myHero.rollThreshold -= 3;
    } else println("not enought xps");
  }
}

void quitPause() {
  if (mode == PAUSE && exitButton.clicked) {
   mode = GAME; 
  }
}
