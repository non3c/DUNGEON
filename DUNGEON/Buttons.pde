class Buttons {
  //instance variables
  PVector pos;
  PVector size;
  color unhoverColor, hoverColor;
  String text;
  String prefix, suffix;
  boolean clicked;
  PImage[] buttons;

  Buttons(float x, float y, float w, float h, color hc, color uc, String t) {
    //constructor 

    pos = new PVector(x, y);
    size = new PVector(w, h);
    unhoverColor = uc;
    hoverColor = hc;
    text = t;
    clicked = false;
  }
  
  Buttons(String pre, String suf, float x, float y, float w, float h, color hc, color uc, String t) {
    //constructor 

    pos = new PVector(x, y);
    size = new PVector(w, h);
    prefix = pre;
    suffix = suf;
    buttons = new PImage[2];
    buttons[1] = loadImage(prefix+"Unhovered"+suffix);
    buttons[2] = loadImage(prefix+"Hovered"+suffix);
    clicked = false;
  }

  void show() {
    //behaviour function
    rectMode(CENTER);
    textAlign(CENTER);
    if ( mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y-size.y/2 && mouseY < pos.y+size.y/2) {
      fill(hoverColor);
      rect(pos.x, pos.y, size.x-5, size.y-5, 20);
      fill(unhoverColor);
      textSize(size.x/4);
      text(text, pos.x, pos.y);

      
    } else {
        fill(unhoverColor);
        rect(pos.x, pos.y, size.x, size.y, 20);
        fill(hoverColor);
        textSize(size.x/4);
        text(text, pos.x, pos.y);
      }
    if (mouseReleased && mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y-size.y/2 && mouseY < pos.y+size.y/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
