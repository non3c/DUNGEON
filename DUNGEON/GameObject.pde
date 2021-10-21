class GameObject {
   //global variables
   int lives, size;
   PVector pos;
   PVector vel; 
  
  GameObject() {
    
  }
  
  void show() {
    
    
  }
  
  void act() {
    //add velocity to position
    pos.add(vel);

  }
  
  
}
