
class Weapons {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int bulletNum;
  color bulletColor;
  float bulletSize;
  float spread;
  
  Weapons() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
    bulletNum = 1;
    bulletSize = 20;
    bulletColor = WHITE;
    spread = 0.5;
    
  }

  Weapons(int thr, int bs, int bn, float sp, float bsize, color bc) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
    bulletNum = bn;
    bulletSize = bsize;
    bulletColor = bc;
    spread = sp;
  }

  void update() {
    shotTimer++;
  }
  
  void show(int w) {

  }

  void shoot() {
    if (shotTimer >= threshold) {
    for (int i = 0; i < bulletNum; i ++) {
      PVector aimVector = new PVector(mouseX-myHero.pos.x, mouseY-myHero.pos.y);
      aimVector.setMag(bulletSpeed);
      PVector bulletSpread = new PVector(random(-spread, spread), random(-spread, spread));
      myObjects.add(new Bullets(aimVector.add(bulletSpread), bulletColor, bulletSize));
      shotTimer = 0;
     }
    
    }
  }
}
