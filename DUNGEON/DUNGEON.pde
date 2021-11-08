import processing.javafx.*; 
AnimatedGIF introBackground;
Buttons startButton;
Hero myHero;
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness; 
ArrayList minimap;
PFont PixelBoy, NineteenNinetySeven;
//room PImages
PImage walls;
PImage floor;
PImage doors;
PImage map;

color northRoom, eastRoom, southRoom, westRoom;
int mode = 0;

//color pallete
color VIOLET       = #6D6479;
color GREY         = #484452;
color DARKPURPLE   = #302E3B;
color PURPLE       = #412E4C;
color VELVET       = #7C425B;
color WHITE        = #EEE4D8;
color DARKWHITE    = #D9D0C3;
color DARKGREEN    = #070A04;
color DARKBROWN    = #261A09;
color BLACK        = #000000;
color ORANGE       = #EA9650;

final int INTRO = 0;
final int GAME =1 ;
final int PAUSE =2 ;
final int GAMEOVER = 3;

boolean hadPressed;
boolean mouseReleased;

void setup() {
  imageMode(CENTER);
  frameRate(60);
  size(1200, 800, FX2D);
  smooth();
  
  PixelBoy = createFont("Fonts/Pixeboy.ttf", 64);
  NineteenNinetySeven = createFont("Fonts/NineteenNinetySeven.ttf", 64);
  introBackground = new AnimatedGIF(20, 4, "GIF/frame_", "_delay-0.1s.png", width/2, height/2, width+200, height);
  startButton = new Buttons(width/2, height/1.3, 300, 150, VIOLET, WHITE, "START", PixelBoy);
  
  walls = loadImage("walls.png");
  floor = loadImage("floor.png");
  doors = loadImage("dooropen.png");
  map = loadImage("map.png");

  //Create Objects
  myObjects = new ArrayList<GameObject>();
  myHero = new Hero();
  myObjects.add(myHero);
  myObjects.add(new Enemy());

  //Create Darkness
  darkness = new ArrayList<DarknessCell>();
  int size = 10;

  int x = 0, y = 0;
  while (x <= width) {
    darkness.add(new DarknessCell(x, y, size));
    x = x + size;
    if (x >= width) {
      y = y + size; 
      x = 0;
    } 
    
    if (y -size >= height) break;    
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
