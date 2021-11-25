class Phaeton extends Enemy {
  Phaeton(int x, int y) {
    super(PHAETON_HP, PHAETON_SIZE, x, y, PHAETON_DAMAGE);
  }
  void act() {
  super.act();
  
    vel = new PVector(myHero.pos.x - pos.x, myHero.pos.y - pos.y);
    vel.setMag(3.5);

    if (isCollidingWith(myHero)) hp = 0;

      }
    }
