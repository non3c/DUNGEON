import processing.javafx.*; 
AnimatedGIF introBackground;

PFont Pixelfont;

int mode = 0;

final int INTRO = 0;
final int GAME =1 ;
final int PAUSE =2 ;
final int GAMEOVER = 3;

boolean hadPressed;
boolean mouseReleased;

void setup() {
  imageMode(CENTER);
  size(1200, 800, FX2D);
  Pixelfont = createFont("Pixelfont.ttf", 64);
 introBackground = new AnimatedGIF(20, 4, "GIF/frame_", "_delay-0.1s.png",  width/2, height/2, width, height);
}

void draw() {
  
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }


  if (mousePressed) hadPressed = true;
    if (hadPressed &&!mousePressed) {
     mouseReleased = true;
     hadPressed = false;
    } else mouseReleased = false;
}
