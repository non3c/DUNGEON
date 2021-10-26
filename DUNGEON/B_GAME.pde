void game() {
    drawRoom();
    drawGameObjects();
}

void drawRoom() {
  background(DARKBROWN);
  
  //corners
  stroke(BLACK);
  strokeWeight(8);
  line(0, 0, width, height);
  line(width, 0, 0, height);
  
  //floor
  rectMode(CENTER);
  stroke(BLACK);
  fill(DARKGREEN);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i ++) {
   GameObject obj = myObjects.get(i);
   obj.show();
   obj.act();
   if (obj.hp <= 0 ) {
    myObjects.remove(i);
    i--;
   }
  }
}
 
