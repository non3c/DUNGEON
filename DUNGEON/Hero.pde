int immuneTimer, immuneThreshold;

class Hero extends GameObject {
  boolean immune = false;
  float speed;

  Weapons myWeapon;

  Hero() {
    super(); 
    hp = 3;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40;
    immuneTimer = 180;
    immuneThreshold = 180;
    myWeapon = new SniperRifle();
    //ArrayList<Weapons> weapons;
  }

  void show() {
    fill(VIOLET);
    stroke(DARKBROWN);
    strokeWeight(2);
    ellipse(pos.x, pos.y, size, size);
    text(hp, pos.x, pos.y);
  }

  void act() {
    super.act();
    immuneTimer ++;

    if (upkey) vel.y = -speed;
    if (leftkey) vel.x = -speed;
    if (downkey) vel.y = speed;
    if (rightkey) vel.x = speed;


    if (!upkey && !downkey) vel.y = vel.y*0.75;
    if (!leftkey && !rightkey) vel.x = vel.x*0.75;

    if (spacekey) {
      speed++;
    }

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

    if (immuneTimer < immuneThreshold) {
      noFill();
      stroke(#40BEFF, 200-immuneTimer);
      strokeWeight(5);
      ellipse(pos.x, pos.y, size+30, size+30);
      immune = true;
    } else immune = false;
  }

  void checkCollision() {

    for (int i = 0; i < myObjects.size(); i ++) {
      GameObject obj = myObjects.get(i);
/*
      if (obj instanceof EnemyProj) {
        if (dist(pos.x, pos.y, obj.pos.x, obj.pos.y) <= obj.size/2 + size/2) {
          if (!immune) {
            obj.lives = 0;
            lives--;
            immuneTimer = 0;
          }
        }
      }
*/
      if (obj instanceof Enemy) {
        if (dist(pos.x, pos.y, obj.pos.x, obj.pos.y) <= obj.size/2 + size/2) {
          if (!immune) {
            hp--;
            immuneTimer = 0;
          }
        }
      }
    }
  }
}
