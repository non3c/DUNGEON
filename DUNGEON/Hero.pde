class Hero extends GameObject {
  
 float speed;
 int roomX, roomY;
 
 Hero() {
  super(); 
   speed = 5;
   roomX = 1;
   roomY = 1;
 }
 void show() {
   fill(VIOLET);
   stroke(DARKGREY);
   strokeWeight(2);
   ellipse(pos.x, pos.y, 40,40);
 }
  
 void act() {
   super.act();
 
 if (upkey) vel.y = -speed;
 if (leftkey) vel.x = -speed;
 if (downkey) vel.y = speed;
 if (rightkey) vel.x = speed;
 
 if(!upkey && !downkey) vel.y = vel.y*0.75;
 if(!leftkey && !rightkey) vel.x = vel.x*0.75;
 
 if (vel.mag() > speed)
  vel.setMag(speed);

}
}
