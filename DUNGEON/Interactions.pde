boolean upkey, downkey, leftkey, rightkey, spacekey, pause, use;

void keyPressed() {
  if (keyCode == 'W')       upkey = true;
  if (keyCode == 'S')     downkey = true;
  if (keyCode == 'A')     leftkey = true;
  if (keyCode == 'D')    rightkey = true;
  if (keyCode == ' ')    spacekey = true;  
  if (keyCode == 'P')       pause = true;
  if (keyCode == 'E')         use = true;
}

void keyReleased() {
  if (keyCode == 'W')       upkey = false;
  if (keyCode == 'S')     downkey = false;
  if (keyCode == 'A')     leftkey = false;
  if (keyCode == 'D')    rightkey = false;
  if (keyCode == ' ')    spacekey = false;    
  if (keyCode == 'P')       pause = false;
  if (keyCode == 'E')         use = false;
}
