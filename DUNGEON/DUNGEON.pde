import processing.javafx.*; 
AnimatedGIF introBackground;
Buttons startButton;
Hero myHero;
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness; 
PFont AncientModernTales;
PImage room;
PImage map;
color northRoom, eastRoom, southRoom, westRoom;
int mode = 0;

//color pallete
color VIOLET       = #6D6479;
color GREY         = #484452;
color DARKGREY     = #302E3B;
color PURPLE       = #412E4C;
color VELVET       = #7C425B;
color WHITE        = #EEE4D8;
color DARKWHITE    = #D9D0C3;
color DARKGREEN    = #070A04;
color DARKBROWN    = #261A09;
color BLACK        = #000000;

final int INTRO = 0;
final int GAME =1 ;
final int PAUSE =2 ;
final int GAMEOVER = 3;

boolean hadPressed;
boolean mouseReleased;

void setup() {
  imageMode(CENTER);
  size(1200, 800, FX2D);
  AncientModernTales = createFont("Fonts/AncientModernTales.ttf", 64);
  introBackground = new AnimatedGIF(20, 4, "GIF/frame_", "_delay-0.1s.png", width/2, height/2, width, height);
  startButton = new Buttons(width/2, height/1.3, 300, 150, VIOLET, WHITE, "START" );
  room = loadImage("room.png");
  map = loadImage("map.png");
  
  //Create Objects
  myObjects = new ArrayList<GameObject>();
  myHero = new Hero();
  myObjects.add(myHero);

  //Create Darkness
  darkness = new ArrayList<DarknessCell>();
  float size = 1;
  
  int x = 0, y = 0;
  for (int i = 0; i <= width; i ++) {
    x = i;
    darkness.add(new DarknessCell(x, y, size));
    if (x >= width && y >=height) {
      y --; 
      x = 0;
    }
    else {break;}
  }
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
