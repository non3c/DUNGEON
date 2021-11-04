
//intro screen
void intro() {
  textAlign(CENTER);
  introBackground.show();
  textFont(PixelBoy);
  textSize(200);
  fill(#4BB45B);
  text("DUNGEON GAME!", width/2, height/2);
  fill(#58FF72);
  text("DUNGEON GAME!", width/2-2, height/2+5);

  startButton.show();
  if (startButton.clicked) {
    mode = 1;
  }
}
