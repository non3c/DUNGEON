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
      GameObject obj = objects.get(i);
      rectMode(CORNER);
      opacity = map(dist(x, y, obj.pos.x, obj.pos.y), 0, obj.lightRadius, 0, 200);
      if (opacity <= lowestOpac) {
        lowestOpac = opacity;
      }
    }
    noStroke();
    fill(#000000, lowestOpac);
    square(x, y, size);
  }
}
