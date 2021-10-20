int f;
int frameNumber;
//intro screen
void intro() {
  //setup
  textAlign(CENTER,CENTER);
  
  //Intro Animation
  frameNumber = 45;
  introGIF[f].resize(width, height);
  image(introGIF[f], width/2, height/2);
   if(frameCount % 4 == 0) f = f+1;
   if (f == frameNumber) f = 0;
  //print title
  textFont(Pixelboy);
  textSize(180);
  fill(#CBCBCB);
  text("ASTEROID GAME!", width/2, height/2.40-5);
  fill(#ffffff);
  textSize(180);
  text("ASTEROID GAME!", width/2, height/2.40);
  //display start button
  if (mouseX > width/2 - buttonSize + 200 && mouseX < width/2 + buttonSize - 200 && mouseY > height/2 - buttonSize + 560 && mouseY < height/1.3 + buttonSize -320) {
    image(startButton[1], width/2, height/1.3, buttonSize, buttonSize-250);
    
  } else {
    image(startButton[0], width/2, height/1.3, buttonSize+5, buttonSize-245);
  }
  
}
