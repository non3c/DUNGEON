class DroppedItem extends GameObject {
  int type;
  int randomWpn;
  Weapons wpn;

  DroppedItem(float x, float y, int rx, int ry) {
    type = int(random(1, 3));
    randomWpn = int(random(0, 3));
    wpn = Weapons.get(randomWpn);
    hp = 1;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    size = 40;
    roomX = rx;
    roomY = ry;
  }
  void show() {

    //id_AMMO = 0;
    //id_GUN = 1;
    //id_HEALTH_POTION = 2;
    //id_COIN = 3;
    if (type == id_AMMO) {
      
    } else if (type == id_GUN) {
       image(WeaponsHold[randomWpn], pos.x, pos.y, size, size/2);
    } else if (type == id_HEALTH_POTION) {
       image(HealthPotion, pos.x, pos.y, size, size);
    }
    stroke(BLACK);
    strokeWeight(2);
    fill(PURPLE);
    //circle(pos.x, pos.y, size);
  }

  void act() {
  }
}
