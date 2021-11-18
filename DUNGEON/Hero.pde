int immuneTimer, immuneThreshold;
boolean immune = false;
class Hero extends GameObject {
  float speed;
  int rollTimer, rollThreshold;
  ArrayList<Weapons> weapons;
  Weapons myWeapon;

  Hero() {
    super(); 
    hp = 20;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40;
    immuneTimer = 180;
    immuneThreshold = 180;
    rollTimer = 60;
    rollThreshold = 60;
    myWeapon = new ShotGun();
    
  }

  void show() {
    fill(VIOLET);
    stroke(DARKBROWN);
    strokeWeight(2);
    ellipse(pos.x, pos.y, size, size);
    fill(WHITE);
    text(hp, pos.x, pos.y);
  }

  void act() {
    super.act();
    immuneTimer ++;
    rollTimer ++;

    if (upkey) vel.y = -speed;
    if (leftkey) vel.x = -speed;
    if (downkey) vel.y = speed;
    if (rightkey) vel.x = speed;


    if (!upkey && !downkey) vel.y = vel.y*0.75;
    if (!leftkey && !rightkey) vel.x = vel.x*0.75;


    if (vel.mag() >= speed) vel.setMag(speed);

    for (int i = 0; i < myObjects.size(); i ++) {
      GameObject obj = myObjects.get(i);
      /* if (obj instanceof EnemyBullet && isCollidingWith(obj)) {
       hp = hp --;
       obj.hp --;
       }
       */
      if (obj instanceof DroppedItem && isCollidingWith(obj)) {
      DroppedItem item = (DroppedItem) obj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp = 0;
        }
      }
    }
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
      stroke(#40BEFF, 180-immuneTimer);
      strokeWeight(5);
      ellipse(pos.x, pos.y, size+30, size+30);
      immune = true;
    } else immune = false;
  }
}
