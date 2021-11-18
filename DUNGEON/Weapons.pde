
class Weapons {
  int bulletHP;
  int wpnDamage;
  int shotTimer;
  int threshold;
  int bulletSpeed;
  int bulletNum;
  color bulletColor;
  float bulletSize;
  float spread;
  
  Weapons() {
    bulletHP = 1;
    shotTimer = 0;
    wpnDamage = 10;
    threshold = 30;
    bulletSpeed = 5;
    bulletNum = 1;
    bulletSize = 20;
    bulletColor = WHITE;
    spread = 0.5;
    
  }

  Weapons(int hp, int thr, int bs, int bn, float sp, float bsize, color bc, int dmg) {
    bulletHP = hp;
    shotTimer = 0;
    wpnDamage = dmg;
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
      myObjects.add(new Bullets(bulletHP, aimVector.add(bulletSpread), bulletColor, bulletSize, wpnDamage));
      shotTimer = 0;
     }
    
    }
  }
}
