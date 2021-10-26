class GameObject {
   //global variables
   int hp;
   PVector pos;
   PVector vel; 
  
  GameObject() {
    hp = 1;
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
  }
  
  void show() {
    
    
  }
  
  void act() {
    //add veposity to position
    pos.add(vel);

    if (pos.x < width*0.1) pos.x = width*0.1;
    if (pos.x > width*0.9) pos.x = width*0.9;
    if (pos.y < height*0.1) pos.x = height*0.1;
    if (pos.y < height*0.9) pos.x = height*0.9;
    
    
  }
  
  
}
