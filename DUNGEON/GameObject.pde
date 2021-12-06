class GameObject {
  //global variables
  int damage;
  int roomX, roomY;
  PVector pos;
  PVector vel; 
  int hpMax;
  int hp;
  int xp;
  int size;
  float speed;
  int lightRadius;


  GameObject() {
    hp = 1;
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
  lightRadius = 0;  
}

  void show() {
  }

  void act() {
    //add veposity to position
    pos.add(vel);

    if (pos.x < width*0.1) pos.x = width*0.1;
    if (pos.x > width*0.9) pos.x = width*0.9;
    if (pos.y < height*0.1) pos.y = height*0.1;
    if (pos.y > height*0.9) pos.y = height*0.9;
  }
  boolean inRoomWith(GameObject myObj) {
    if (roomX == myObj.roomX && roomY == myObj.roomY) {
      return true;
    } else return false;
  }

  boolean isCollidingWith(GameObject myObj) {
    if (inRoomWith(myObj) && dist(myObj.pos.x, myObj.pos.y, pos.x, pos.y) < size/2 + myObj.size) 
      return true;
    else
      return false;
  }
}
