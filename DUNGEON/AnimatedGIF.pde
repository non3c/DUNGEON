class AnimatedGIF {
  //instance variables
  int size;
  int rate;
  int currFrame;
  PImage[] gif;
  String prefix, suffix;
  int f;
  int frameNumber;


  AnimatedGIF(int arraySize, int r, String p, String s) {
    //constructor 
    size = arraySize;
    rate = r;
    prefix = p;
    suffix = s;
    gif = new PImage[size];
    for (int i = 0; i < size; i ++) {
      gif[i] = loadImage(prefix+i+suffix);
    }
    currFrame = 0 ;
  }
  void show(float px, float py, float w, float h) {
    //behaviour function
    if (currFrame >= gif.length) currFrame = 0;
    image(gif[currFrame], px, py, w, h);
    if (frameCount % rate == 0) currFrame++;
  }

  void loadgif(String prefix, String suffix) {
    int i = 0;
    while (i < gif.length) {
      String leadingZero = "";
      if (gif.length <= 10) leadingZero = "";
      else if (gif.length <= 100) {
        if (i < 10) leadingZero = "0";
        else leadingZero = "";
      } else if (gif.length > 100) {
        if (i < 10) leadingZero = "00";
        else if (i < 100) leadingZero = "0";
        else leadingZero = "";
      }
      gif[i] = loadImage(prefix+leadingZero+i+suffix);
      i++;
    }
  }
}
