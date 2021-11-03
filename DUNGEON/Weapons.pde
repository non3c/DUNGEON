class Weapons {

  int shotTimer;
  int threshold;
  int bulletSpeed;

  Weapons() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
  }

  Weapons(int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
  }

  void update() {
    shotTimer++;
  }

  void shoot(int bulletNum, int spread) {
    for (int i = 0; i <= bulletNum; i ++) {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.pos.x, mouseY-myHero.pos.y);
      aimVector.setMag(bulletSpeed);
      PVector bulletSpread = new PVector(random(-spread, spread),random(-spread, spread));
      myObjects.add(new Bullets(aimVector.add(bulletSpread), WHITE, 20));
      shotTimer = 0;
     }
    }
  }
}
