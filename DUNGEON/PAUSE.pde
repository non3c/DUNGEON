//pause screen
void pause() {
  //setup
  rectMode(CENTER);
  //print texts
  fill(#363636, 40);
  noStroke();
  rect(width/2, height/2, width, height);
  textFont(Pixelboy);
  textSize(128);
  fill(#FAFAFA);
  text("GAME PAUSED...", width/2, height/2);
  textSize(64);
  fill(#FAFAFA);
  text("PRESS ANY KEY TO CONTINUE", width/2, height/2+100);
  
  
}
