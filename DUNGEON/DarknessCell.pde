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
    square(x,y,size); 
    opacity = map(dist(x, y, myHero.pos.x, myHero.pos.y), 0, 500, 50, 200); 
  }
}
