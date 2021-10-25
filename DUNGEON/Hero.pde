class Hero extends GameObject {
  
 float speed;
 int roomX, roomY;
 
 Hero() {
  super(); 
   speed = 5;
   roomX = 1;
   roomY = 1;
 }
 void show {
   
 }
  
 void act() {
 super.act();
 
 if (w) vel.y = -speed;
 if (a) vel.x = -speed;
 if (s) vel.y = speed;
 if (d) vel.x = speed;
    
 
 if (vel.mag() > speed)
  vel.setMag(speed);

}
}
