import processing.javafx.*;

int mode = 0;

final int INTRO = 0;
final int GAME =1 ;
final int PAUSE =2 ;
final int GAMEOVER = 3;

void setup() {
  size(1000, 800, FX2D);
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
}
