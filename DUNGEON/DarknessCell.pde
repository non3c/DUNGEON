class DarknessCell {
  float opacity;
  float x, y, size;

  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 255;
  }
  
  void show() {
    noStroke();
    fill(#000000, opacity);
    square(x,y,size); 
    opacity = map(dist(x, y, myHero.pos.x, myHero.pos.y), 0, 100, 0, 255); 
  }
}
