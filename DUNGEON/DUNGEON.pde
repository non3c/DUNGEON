import processing.javafx.*;
//import processing.sprite;
AnimatedGIF introBackground;
Buttons startButton;
Hero myHero;
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
ArrayList minimap;
PFont PixelBoy, NineteenNinetySeven;
//GameObjects appearence
PImage[] Weapons;
PImage[] Bullets;
AnimatedGIF heroFaceLeft;
AnimatedGIF heroFaceRight;
AnimatedGIF heroMoveLeft;
AnimatedGIF heroMoveRight;

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

  //
  Bullets = new PImage[3];
  PixelBoy = createFont("Fonts/Pixeboy.ttf", 64);
  NineteenNinetySeven = createFont("Fonts/NineteenNinetySeven.ttf", 64);
  introBackground = new AnimatedGIF(20, 4, "GIF/frame_", "_delay-0.1s.png");
  heroFaceLeft = new AnimatedGIF(2, 10, "Props/HeroAnimation/FaceLeft/FaceLeft_", ".png");
  heroFaceRight = new AnimatedGIF(2, 10, "Props/HeroAnimation/FaceRight/FaceRight_", ".png");
  heroMoveLeft = new AnimatedGIF(4, 10, "Props/HeroAnimation/MoveLeft/MoveLeft_", ".png");
  heroMoveRight = new AnimatedGIF(4, 10, "Props/HeroAnimation/MoveRight/MoveRight_", ".png");
  startButton = new Buttons(width/2, height/1.3, 300, 150, VIOLET, WHITE, "START", PixelBoy);


  //Loading
  walls = loadImage("Props/Room/walls.png");
  floor = loadImage("Props/Room/floor.png");
  doors = loadImage("Props/Room/dooropen.png");
  map = loadImage("Props/map.png");


  for (int i = 0; i<3; i++) {
    Bullets[i] = loadImage("Props/Bullets/Bullet_"+i+".png");
  }
  
  for (int i = 0; i<3; i++) {
    Weapons[i] = loadImage("Props/Weapons/Weapns_"+i+".png");
  }

  //Create Objects
  myObjects = new ArrayList<GameObject>();
  myHero = new Hero();
  myObjects.add(myHero);


  myObjects.add(new  Phaeton(1, 2));

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
    if (y-size >= height) break;
  }
  
  //Spawn enemies
  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == #be8b00) {
      myObjects.add(new Minotaur(x, y));
    }
    if (roomColor == #ff4900) {
      myObjects.add(new Medusa(x, y));
    }
    x++;
    if ( x== map.width) {
      x = 0;
      y++;
    }
  }
}

//Dropped Items
final int AMMO = 0;
final int GUN = 1;
final int HEALTH = 2;
final int MONEY = 3;

//Weapons
final int Pistol = 0;
final int ShotGun = 1;
final int AssultRifle = 2;
final int SniperRifle = 3;
//final int
//final int 
//final int 


//Enemy Settings
final int MINOTAUR_HP = 300;
final int MINOTAUR_SIZE = 90;
final int MINOTAUR_DAMAGE = 5;

final int MEDUSA_HP = 1000;
final int MEDUSA_SIZE = 100;
final int MEDUSA_THRESHOLD = 100;
final int MEDUSA_DAMAGE = 2;

final int PHAETON_HP = 50;
final int PHAETON_SIZE = 45;
final int PHAETON_DAMAGE = 15;




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
