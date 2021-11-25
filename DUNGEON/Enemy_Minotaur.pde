class Minotaur extends Enemy {
  Minotaur(int x, int y) {
    super(MINOTAUR_HP, MINOTAUR_SIZE, x, y, MINOTAUR_DAMAGE);
  }
  void act() {
    super.act();

    vel = new PVector(myHero.pos.x - pos.x, myHero.pos.y - pos.y);
    vel.setMag(1);
  }
}
