  PVector aimVector;
class Weapons {
  int bulletHP;
  int wpnDamage;
  int shotTimer;
  int threshold;
  int bulletSpeed;
  int bulletNum;
  int bulletType;
  int size;
  int type;
  PVector bulletSize;

  float spread;
  
  Weapons() {
    type = 0;
    size = 50;
    bulletHP = 1;
    shotTimer = 0;
    wpnDamage = 10;
    threshold = 30;
    bulletSpeed = 5;
    bulletNum = 1;
    bulletType = 0;
    bulletSize = new PVector(18, 16);
    spread = 0.5;
  }

  Weapons(int hp, int s, int bt, int thr, int bs, int bn, float sp, float bsize_x, float bsize_y, int dmg, int gunType) { 
    //bullethealth, size, bullettype, threshold, bulletspeed, bulletnumber, spread, bulletsizex, bulletsizey, bulletdamage, guntype
    size = s;
    type = gunType;
    bulletHP = hp;
    shotTimer = 0;
    wpnDamage = dmg;
    threshold = thr;
    bulletSpeed = bs;
    bulletNum = bn;
    bulletType = bt;
    bulletSize = new PVector(bsize_x, bsize_y);
    spread = sp;
  }

  void update() {
    shotTimer++;
  }
  
  void show() {
    aimVector = new PVector(mouseX-myHero.pos.x, mouseY-myHero.pos.y);
    pushMatrix();
    if (aimVector.x > 0) {
    translate(myHero.pos.x+12, myHero.pos.y+5); 
    scale(1, 1);
    rotate(aimVector.heading());
    } else if (aimVector.x < 0) {
    translate(myHero.pos.x-12, myHero.pos.y+5); 
    scale(1, -1);
    rotate(-aimVector.heading());
    }
    stroke(#818181, 20);
    image(WeaponsHold[type], 0, 0, size, size/2-3);
    popMatrix();
  }

  void shoot() {
    if (shotTimer >= threshold) {
    for (int i = 0; i < bulletNum; i ++) {
      aimVector = new PVector(mouseX-myHero.pos.x, mouseY-myHero.pos.y);
      aimVector.setMag(bulletSpeed);
      PVector bulletSpread = new PVector(random(-spread, spread), random(-spread, spread));
      myObjects.add(new Bullets(bulletHP, aimVector.add(bulletSpread), bulletSize.x, bulletSize.y, wpnDamage, bulletType));
      shotTimer = 0;
     }
    
    }
  }
}
