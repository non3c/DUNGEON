void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMinimap();
  
}

void drawRoom() {
  imageMode(CENTER);
  image(walls, width/2, height/2, width, height);
  
  //corners
  stroke(BLACK);
  strokeWeight(10);
  line(0, 0, width, height);
  line(width, 0, 0, height);
  
  //draw exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom  = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom  = map.get(myHero.roomX-1, myHero.roomY);
  noStroke();
  fill(BLACK);
  if (northRoom != #686868) {
  
   image(doors, width/2, height*0.05, 125, 100);
  }
  if (southRoom != #686868) {
   
   image(doors, width/2, height*0.95, 125, 100);
  }
  if (eastRoom != #686868) {
   
   image(doors, width*0.95, height/2, 125, 100);
  }
  if (westRoom != #686868) {
 
   image(doors, width*0.05, height/2, 125, 100);
  }

  //floor
  
  imageMode(CENTER);
  image(floor,width/2, height/2, width*0.8, height*0.8);
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


void drawMinimap() {
  minimap = new ArrayList();
  
  int size = 20;
  int x = 0, y = 0;
  while (y < map.height) {
    color c = map.get(x,y);
    fill(c, 150);
    square(950+x*size,50+y*size,size);
    x = x + 1;
    if (x >= map.width) {
      x = 0;
      y = y + 1; 
    } 
  }
  rect(size);
  
}
void drawLightLayer() {
  for (int i = 0; i < darkness.size(); i ++) {
   DarknessCell dark = darkness.get(i);
   dark.show();

   }
}
 
