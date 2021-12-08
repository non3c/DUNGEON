class DarknessCell {
  float opacity;
  float x, y, size;

  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 255;
  }

  void show(ArrayList<GameObject> objects) {
    float lowestOpac = 255;
    for (int i = 0; i < objects.size(); i ++) {
      rectMode(CORNER);
      opacity = map(dist(x, y, objects.pos.x, objects.pos.y), 0, objects.lightRadius, 0, 200); 
   
      noStroke();
      fill(#000000, lowestOpac);
      square(x, y, size);
    }
  }
}
