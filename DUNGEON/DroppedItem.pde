class DroppedItem extends GameObject {
  int type;
  Weapons w;

  DroppedItem(float x, float y, int rx, int ry) {
    type = int(random(0, 3));
    w = new AssultRifle();
    hp = 1;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
  }
  void show() {
   stroke(BLACK);
   strokeWeight(2);
   fill(PURPLE);
   circle(pos.x, pos.y, size);
  }
  
  void act() {
    
  }
}
