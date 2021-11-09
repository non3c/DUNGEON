class Hero extends GameObject {

  float speed;

  Weapons myWeapon;

  Hero() {
    super(); 
    hp = 3;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40;
    myWeapon = new SniperRifle();
    //ArrayList<Weapons> weapons;
  }

  void show() {
    fill(VIOLET);
    stroke(DARKBROWN);
    strokeWeight(2);
    ellipse(pos.x, pos.y, size, size);
  }

  void act() {
    super.act();

    if (upkey) vel.y = -speed;
    if (leftkey) vel.x = -speed;
    if (downkey) vel.y = speed;
    if (rightkey) vel.x = speed;


    if (!upkey && !downkey) vel.y = vel.y*0.75;
    if (!leftkey && !rightkey) vel.x = vel.x*0.75;

    if (spacekey) speed = 13;
    if (!spacekey) speed = 5;
    if (vel.mag() > speed)
      vel.setMag(speed);

    //check exits
    if (northRoom !=#848484 && pos.y == height*0.1 && pos.x >= width/2-50 && pos.x <= width/2+50) {
      roomY--;
      pos = new PVector(width/2, height*0.9-10);
    }

    if (southRoom !=#848484 && pos.y == height*0.9 && pos.x >= width/2-50 && pos.x <= width/2+50) {
      roomY++;
      pos = new PVector(width/2, height*0.1+10);
    }

    if (eastRoom !=#848484 && pos.x == width*0.9 && pos.y >= height/2-50 && pos.y <= height/2+50) {
      roomX++;
      pos = new PVector(width*0.1+10, height/2);
    }

    if (westRoom !=#848484 && pos.x == width*0.1 && pos.y >= height/2-50 && pos.y <= height/2+50) {
      roomX--;
      pos = new PVector(width*0.9-10, height/2);
    }

    myWeapon.update();
    if (mousePressed) {
      myWeapon.shoot();
    }
  }
}
