class Medusa extends Enemy {
  Medusa(int x, int y) {
    super(MEDUSA_HP, MEDUSA_SIZE, x, y);
  }
  void act() {
    super.act();

    //movement
    vel = new PVector(myHero.pos.x - pos.x, myHero.pos.y - pos.y);
    vel.setMag(2);

    if (dist(pos.x, pos.y, myHero.pos.x, myHero.pos.y) <= 550) {
      vel.x = vel.x * 0.3;
      vel.y = vel.y * 0.3;
      //slow down when approaching myHero
    }
    if (dist(pos.x, pos.y, myHero.pos.x, myHero.pos.y) <= 400) {
      vel.x = vel.x * 0.05;
      vel.y = vel.y * 0.05;
      //stop when approaching myHero
    }

    //bullets
  }
}
