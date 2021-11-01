
//intro screen
void intro() {
  textAlign(CENTER);
  introBackground.show();
  textFont(NineteenNinetySeven);
  textSize(86);
  fill(#061501);
  text("DUNGEON GAME!", width/2, height/2);
  fill(#0E3902);
  text("DUNGEON GAME!", width/2, height/2+5);

  startButton.show();
  if (startButton.clicked) {
    mode = 1;
  }
}
