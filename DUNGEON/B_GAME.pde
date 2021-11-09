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


  if (northRoom != #848484) { 
   // pushMatrix();
   // rotate(0);
   // translate(width/2, height*0.05);
    image(doors, width/2, height*0.05, 125, 100);
   // popMatrix();
  }

  if (southRoom != #848484) {
    //pushMatrix();
    //rotate(PI);
   // translate(width/2, height*0.95);
    image(doors, width/2, height*0.95, 125, 100);
   // popMatrix();
  }
  if (eastRoom != #848484) {
   // pushMatrix();
   // rotate(PI/0.75);
   // translate(width*0.95, height/2);
    image(doors, width*0.95, height/2, 125, 100);
    //popMatrix();
  }
  if (westRoom != #848484) {
   // pushMatrix();
   // rotate(PI/2);
    //translate(width*0.05, height/2);
    image(doors, width*0.05, height/2, 125, 100);
   // popMatrix();
  }

  //floor

  imageMode(CENTER);
  image(floor, width/2, height/2, width*0.8, height*0.8);
}

void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i ++) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
      if (obj.hp <= 0 ) {
        myObjects.remove(i);
        i--;
      }
    }
  }
}


void drawMinimap() {
  minimap = new ArrayList();
  fill(#8E0000, 100);
  stroke(#580000);
  strokeWeight(5);
  rect(940, 40, 220, 220);

  int size = 20;
  int x = 0, y = 0;
  while (y < map.height) {
    color c = map.get(x, y);

    fill(c, 200);
    if (c != #848484) {
      stroke(#481204);
      strokeWeight(1);
    } else noStroke();
    square(950+x*size, 50+y*size, size);
    x = x + 1;
    if (x >= map.width) {
      x = 0;
      y = y + 1;
    }
  }
  strokeWeight(2);
  stroke(#FF9D6F);
  fill(#FF9C50, 240);
  rect(950+myHero.roomX*size, 50+myHero.roomY*size, size, size);
}
void drawLightLayer() {
  for (int i = 0; i < darkness.size(); i ++) {
    DarknessCell dark = darkness.get(i);
    dark.show();
  }
}
