class Enemy extends GameObject {

  Enemy() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
  }

  Enemy(int _hp, int _s, int x, int y) {
    pos = new PVector(random(width*0.15, width*0.85), random(height*0.15, height*0.85));
    vel = new PVector(0, 0);
    hp = _hp;
    roomX = x;
    roomY = y;
    size = _s;
  }

  void show() {

    stroke(BLACK);
    strokeWeight(1);
    fill(WHITE);
    ellipse(pos.x, pos.y, size, size);
    fill(BLACK);
    text(hp, pos.x, pos.y);
  }

  void act() {
    super.act();
    for (int i = 0; i < myObjects.size(); i ++) {
      GameObject obj = myObjects.get(i);
      // lose lives when getting shot
      if (obj instanceof Bullets) {
        if (dist(pos.x, pos.y, obj.pos.x, obj.pos.y) <= obj.size/2 + size/2) {
          obj.hp --;
          hp = hp - obj.damage;
        }
      }
    }
  }
}
