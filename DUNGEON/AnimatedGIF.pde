class AnimatedGif {
 //instance variables
 int s;
 int currFrame;
 PImage[] gif;
 float posx, posy;
 float w, h;
 AnimatedGif(int arraySize, String prefix, String suffix, float _x, float _y, float _w, float _h) {
  //constructor 

   s = arraySize;
   posx = _x;
   posy = _y;
   w = _w;
   h = _h;
   String p = prefix;
   String t = suffix;
   gif = new PImage[s];
   for (int i = 0; i < s; i ++) {
     gif[i] = loadImage(p+i+t);
   }
   currFrame = 0 ;
  
  
 }
 
 
 void show() {
 //behaviour function
   if (currFrame == s) currFrame = 0;
     image(gif[currFrame], posx, posy, w, h);
     currFrame ++;
   
 }
}
