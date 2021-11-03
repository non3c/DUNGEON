class Bullets extends GameObject{
  // instance variables
  int size;
  PVector nudge;
  color Bcolor;

  Bullets(PVector aim, color c, int s) {
    //constructor
   hp = 1; 
   pos = new PVector (myHero.pos.x, myHero.pos.y);
   vel = new PVector (aim.x, aim.y);
   // adjust the location
   nudge = aim.copy();
   nudge.rotate(PI);
   nudge.setMag(-5);
   pos.add(nudge);
   vel.setMag(16.5);
   vel.add(aim);
   size = s;
   Bcolor = s;
}

void show() {
  //appearence
  stroke(#818181, 80);
  strokeWeight(5);
  fill(Bcolor, 95);
  ellipse(pos.x, pos.y, size, size);
  
  
}

void act() {
  pos.add(vel);
  if (pos.x < width*0.1) hp = 0;
  if (pos.x > width*0.9) hp = 0;
  if (pos.y < height*0.1) hp = 0;
  if (pos.y > height*0.9) hp = 0;
  }
  
}
