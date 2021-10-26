
//intro screen
void intro() {
  textAlign(CENTER);
  introBackground.show();
  textFont(AncientModernTales);
  textSize(128);
  fill(#061501);
  text("WOOOOW! DUNGEON!", width/2, height/2);
  fill(#0E3902);
  text("WOOOOW! DUNGEON!", width/2, height/2+5);

  startButton.show();
  if (startButton.clicked) {
    mode = 1;
  }
}
