class Minotaur extends Enemy {
  Minotaur(int x, int y) {
    super(100, 50, x, y);
  }
  void act() {
    super.act();
    
    vel = new PVector(myHero.pos.x - pos.x, myHero.pos.y - pos.y);
    vel.setMag(1);
  }
}
