class Buttons {
  //instance variables
  PVector pos;
  PVector size;
  color unhoverColor, hoverColor;
  String text;
  PFont font;
  float fontSize;
  String prefix, suffix;
  boolean clicked;
  PImage[] buttons;

  Buttons(float x, float y, float w, float h, color hc, color uc, String t, PFont f, float fs) {
    //constructor 

    pos = new PVector(x, y);
    size = new PVector(w, h);
    fontSize = fs;
    unhoverColor = uc;
    hoverColor = hc;
    font = f;
    text = t;
    clicked = false;
  }

  Buttons(String pre, String suf, float x, float y, float w, float h, float fs) {
    //constructor 
    pos = new PVector(x, y);
    size = new PVector(w, h);
    fontSize = fs;
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
    stroke(hoverColor);
    strokeWeight(5);
    if ( mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y-size.y/2 && mouseY < pos.y+size.y/2) {
      textFont(font);
      fill(hoverColor);
      rect(pos.x, pos.y, size.x-5, size.y-5, 10);
      fill(unhoverColor);
      textSize(fontSize);
      text(text, pos.x, pos.y+10);
    } else {
      textFont(font);
      fill(unhoverColor);
      rect(pos.x, pos.y, size.x, size.y, 10);
      fill(hoverColor);
      textSize(fontSize+5);
      text(text, pos.x, pos.y+10);
    }
    if (mouseReleased && mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y-size.y/2 && mouseY < pos.y+size.y/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
