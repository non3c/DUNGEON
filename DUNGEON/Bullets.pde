class Bullets extends GameObject {
  // instance variables
  float size;
  PVector nudge;
  PVector dir;
  color Bcolor;

  Bullets(int h, PVector aim, color c, float s, int d) {
    //constructor
    hp = h; 
    damage = d;
    pos = new PVector (myHero.pos.x, myHero.pos.y);
    vel = new PVector (aim.x, aim.y);
    dir = new PVector (aim.x, aim.y);
    // adjust the location
    nudge = aim.copy();
    nudge.rotate(PI);
    nudge.setMag(-30);
    pos.add(nudge);
    vel.setMag(16.5);
    vel.add(aim);
    size = s;
    Bcolor = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    //appearence
    //pushMatrix();
    //translate(pos.x, pos.y);
    //rotate(dir.heading());
    stroke(#818181, 20);
    strokeWeight(1);
    fill(Bcolor);
    ellipse(pos.x, pos.y, size, size);
    //popMatrix();
  }

  void act() {
    pos.add(vel);
    if (pos.x < width*0.1) hp = 0;
    if (pos.x > width*0.9) hp = 0;
    if (pos.y < height*0.1) hp = 0;
    if (pos.y > height*0.9) hp = 0;
  }
}
