int EnemySpawn;
int HealthStatus = 6;

void game() {
  //setup
  ellipseMode(CENTER);
  //random interval for spawning enemyShips
  EnemySpawn = int(random(0, 1000));

  if (start) {
    //create game objects
    myShip.lives = 6;
    myShip.pos = new PVector(width/2, height/2);
    myShip.dir = new PVector(0, -0.1);
    myShip.vel = new PVector(0, 0);
    myObject.add(myShip);
    myObject.add(new Asteroids());
    myObject.add(new Asteroids());
    myObject.add(new Asteroids());
    myObject.add(new Asteroids());
    myObject.add(new Asteroids());
    randomBG = int(random(0, BGnum));
    start = false;
  }
  //random backgrounds
  image(backGround[randomBG], width/2, height/2);
  backGround[randomBG].resize(width, height);
  //pause
  if (pause) {
   mode = 2; 
  }
  //display myShip
  myShip.show();
  myShip.act();
  myShip.checkCollision();
  //enemyship spawns  
  if ( EnemySpawn == 0) {
    myObject.add(new EnemyShip());
    EnemySpawn = 0;
  }
  //display game objects
  for (int i = 0; i < myObject.size(); i ++) {
    GameObject obj = myObject.get(i);
    obj.show();
    obj.act();
    //remove game objects if their lives = 0
    if (obj.lives <= 0) {
      myObject.remove(i);
    }
  }
  // display the health bar of myShip
  if (HealthStatus >= 0) {
    HealthStatus = myShip.lives;
    healthBar[HealthStatus].resize(443/2, 199/2);
    image(healthBar[HealthStatus], 120, 50);
  }
  //gameover
  if (myShip.lives <= 0 || score == 100) {
    mode = 3;    
  }
  
  //teleport cooldown indicator
  stroke(#5A006C);
  strokeWeight(2);
  fill(#B577C1);
  ellipse(280, 55, 72, 72);
  stroke(#B02BCB);
  strokeWeight(1);
  fill(#DF40FF);
  if (teleportTimer <= 720) ellipse(280, 55, teleportTimer/10, teleportTimer/10);
  else ellipse(280, 55, 72, 72);
 
}
