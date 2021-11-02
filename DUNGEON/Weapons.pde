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

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.pos.x, mouseY-myHero.pos.y);
      aimVector.setMag(bulletSpeed);
      //myObject.add(new Bullets(aimVector, WHITE, 10));
      shotTimer = 0;
    }
  }
}
