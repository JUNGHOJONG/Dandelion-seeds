class Background {

  PFont myFont1;
  PImage background;
  float r;
  float g;
  float b;
  float savedTime;
  float totalTime;
  float bright;
  float brightSpeed;

  float theta;
  float thetaSpeed;

  Background() {

    myFont1= loadFont("KunstlerScript-48.vlw");
    background= loadImage("background.jpg");
    background.resize(width, height);
    textFont(myFont1, 40);
    textSize(50);
    textAlign(CENTER);

    r=0;
    g=0;
    b=0;

    savedTime=millis();
    totalTime=500;
    bright=0.525;
    brightSpeed=0.001;

    theta=0;
    thetaSpeed=0.02;
  }

  void timer() {

    float passedTime= millis()-savedTime;

    if (passedTime>totalTime) {

      bright+=brightSpeed;
      savedTime=millis();

      if (bright>0.575) {

        brightSpeed=-brightSpeed;
      } else if (bright<0.525) {

        brightSpeed=-brightSpeed;
      }
    }
  }

  void display() {

    //image(background, 0, 0);
    loadPixels();
    background.loadPixels();
    for (int y=0; y<background.height; y++) {

      for (int x=0; x<background.width; x++) {

        int loc= x+y*background.width;

        r= red(background.pixels[loc]);
        g= green(background.pixels[loc]);
        b= blue(background.pixels[loc]);

        //float bright= ((float)mouseX/width);
        //bright= map(bright, 0, 1, 0.525, 0.575);
        r*=bright;
        g*=bright;
        b*=bright;

        r=constrain(r, 0, 255);
        g=constrain(g, 0, 255);
        b=constrain(b, 0, 255);

        color c= color(r, g, b);
        pixels[loc]= c;
      }
    }
    updatePixels();

    //image(background, 0, 0);

    filter(POSTERIZE, 4);
    //tint 
    //filter(THRESHOLD, 10);

    fill(255, 180);
    text("Davinci.J", width/2, height/6);
  }
}
