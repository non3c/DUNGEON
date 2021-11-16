class Phaeton extends Enemy {
  Phaeton(int x, int y) {
    super(50, 50, x, y);
  }
  void act() {
    super.act();

    vel = new PVector(myHero.pos.x - pos.x, myHero.pos.y - pos.y);
    vel.setMag(3.5);

    for (int i = 0; i < myObjects.size(); i ++) {
      GameObject obj = myObjects.get(i);
      /*
      if (obj instanceof EnemyProj) {
       if (dist(pos.x, pos.y, obj.pos.x, obj.pos.y) <= obj.size/2 + size/2) {
       if (!immune) {
       obj.lives = 0;
       lives--;
       immuneTimer = 0;
       }
       }
       }
       */
      if (obj instanceof Hero) {
        if (dist(pos.x, pos.y, obj.pos.x, obj.pos.y) <= obj.size/2 + size/2) {
          if (!immune) {
            obj.hp = obj.hp - 3; 
            hp = hp - 10000;
            immuneTimer = 0;
          }
        }
      }
    }
  }
}
