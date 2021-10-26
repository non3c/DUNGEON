void game() {
  drawRoom();
  drawGameObjects();
    
    
}

void drawRoom() {
  imageMode(CENTER);
  image(room, width/2, height/2, width, height);
  
  //corners
  stroke(BLACK);
  strokeWeight(8);
  line(0, 0, width, height);
  line(width, 0, 0, height);
  
  //draw exits
  //northRoom = map.get(myHero.roomX, myHero.roomY-1);
  //eastRoom  = map.get(myHero.roomX+1, myHero.roomY);
  //southRoom = map.get(myHero.roomX, myHero.roomY+1);
  //westRoom = map.get(myHero.roomX-1, myHero.roomY);
  //floor
  imageMode(CENTER);
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
 
