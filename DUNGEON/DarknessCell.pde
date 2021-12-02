class DarknessCell {
  float opacity;
  float x, y, size;

  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 200;
  }

  void show() {
    rectMode(CORNER);


    noStroke();
    fill(#000000, opacity);
    square(x, y, size); 
    opacity = map(dist(x, y, myHero.pos.x, myHero.pos.y), 0, 400, 50, 200); 
    //for (int i = 0; i < myObjects.size(); i ++) {
    //  GameObject obj = myObjects.get(i);
    //  if (obj instanceof Bullets) {
    //    opacity = map(dist(x, y, obj.pos.x, obj.pos.y), 0, 10, 0, 50);
    //  }
    //}
  }
}
